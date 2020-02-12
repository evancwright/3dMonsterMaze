;maze.asm
MAZE_SIZE EQU 361 ; size of maze data in bytes
START_OFFSET EQU 340  ; hex 154 bytes into the maze
SCREEN_WIDTH_BYTES EQU 32
TOP_DOWN_VSKIP EQU 13

;resets the maze and associated variables
make_maze
	pshs a,y
	;uncheat
	clr cheat
	;reset maze to all walls
	lda #WALL
	ldy #0
@lp	sta maze_data,y
	leay 1,y
	cmpy #MAZE_SIZE
	bne @lp 
	;reset cursor for carving out halls
	lda #17
	sta cursorX
	sta cursorY
	ldy #START_OFFSET
	leay maze_data,y
	sty cursor
	;make the bottom,right cell a hall
	lda #EMPTY
	sta ,y
	;make a whole bunch of passages
	lda #0
@l2 jsr make_passage
	inca
	cmpa #255
	bne @l2
	puls a,y
    jsr place_exit
	clr cheat
	rts

	
;pick a direction 0-3 and cut out a passage in that direction
;saves a,b
make_passage
	pshs d
	;generate a number (1-3) for passage len
	ldd #3
	pshu d
	jsr randmod ; now pick a random direction
	pulu d
	incb ; make 1-3 instead of 0-2
	stb passageLen
	;jsr random
;	lda 
;	jsr amodb
;	lsr a ; times 2 to make it even
;	lda #1
;	sta passageLen
	ldd #4
	pshu d
	jsr randmod ; now pick a random direction
	pulu d
	; ldb #LEFT ; hack for testing!
	stb cursorDir
	cmpb #UP
	bne @d
	jsr make_passage_up
	bra @o
@d	cmpb #DOWN
	bne @l
	jsr make_passage_down
	bra @o
@l	cmpb #LEFT
	bne @r
	jsr make_passage_left
	bra @o 
@r 	jsr make_passage_right
@o	puls d
	rts

	
make_passage_up
    lda #1
	sta limit
	ldy #cursorY
	sty limitVar
	jsr remove_walls
@x	rts
	
make_passage_down
    lda #17
	sta limit
	ldy #cursorY
	sty limitVar
	jsr remove_walls
	rts
	
make_passage_left
    lda #1
	sta limit
	ldy #cursorX
	sty limitVar
	jsr remove_walls
	rts
	
make_passage_right
    lda #17
	sta limit
	ldy #cursorX
	sty limitVar
	jsr remove_walls
	rts

;limitVar set addr of cursorX or cursorY
;limit set to 1 or 17 (the edge)
remove_walls
	pshu s
	ldy cursor
	lda passageLen
	ldx limitVar
@lp ldb 0,x ; did we hit outer wall?
	cmpb limit
	beq @x
	pshs a ; save 
	lda #EMPTY
	jsr move_cusor
	ldy cursor
	sta ,y
	jsr move_cusor
	ldy cursor
	sta ,y
	puls a ; restore loop counter
	deca
	cmpa #0
	bne @lp
@x	pulu s
	rts
	
;move cursor based on cursorDir
;and updates its x,y counterparts
move_cusor
	pshs a,x
	ldx cursor
	lda cursorDir
	cmpa #UP
	bne @d
	leax -19,x  ; go up a row
	ldb cursorY ; decrement cursor
	decb
	stb cursorY
	bra @x
@d  cmpa #DOWN
	bne @l
	leax 19,x   ;go down a row
	ldb cursorY ; inc cursorY
	incb
	stb cursorY
	bra @x
@l  cmpa #LEFT
	bne @r
	leax -1,x
	ldb cursorX ; dec cursorX
	decb 
	stb cursorX
	bra @x
@r  leax 1,x 		
	ldb cursorX ; inc cursorX
	incb 
	stb cursorX
@x	stx cursor ; save the new cursor location
	puls a,x
	rts


;used to find a square for an exit pattern on open up into
;sets y to a pointer in the maze\
;u  =min x b = x range
;u[1] = max y, b = y range 
;x >= 2 and x <= 15
;y >= 2 and x <= 15
get_rand_open
@lp ; get a random x
	lda #0
	ldb 1,u ; load x range
	pshu d
	jsr randmod
	pulu d
	addb ,u ; add min x  
	stb xcoord
	;generate y
	lda #0 ; clear a 
	ldb 3,u ; load y range
	pshu d
	jsr randmod
	pulu d
	addb 2,u ; add min y  
	stb ycoord	
	;convert the x,y coord to an offset withtin the maze data
	lda #19
	ldb ycoord
	mul ; y * 19 -> d
	pshs  d	; save intermediate value
	lda #0 ; get x offset in d
	ldb xcoord
	addd ,s ; add x offset to coordinate3
	leas 2,s ; "pop" intermediate value
	tfr d,y  ; move offset to y
	leay maze_data,y
	lda ,y  ; get square at the offset
	cmpa #EMPTY
	bne @lp
	rts
	
;place exit
;places one of the four exit types in the maze	
place_exit
	ldd #4
	pshu d
	jsr randmod
	pulu d
	cmpb #0
	bne @d
	jsr place_exit_up
	bra @x
@d	cmpb #1
	bne @l
	jsr place_exit_down
	bra @x
@l	cmpb #2
	bne @r
	jsr place_exit_left
	bra @x
@r	jsr place_exit_right
@x	rts


place_exit_up
	lda #1 ; min y 
	ldb #15 ; y range (1-15 inclusive)
	pshu d	
	lda #2 ; min x 
	ldb #16 ; x range (produces 2-17 inclusive)
	pshu d
	jsr get_rand_open
	leau 4,u  ; pop params
	leay 17,y  ; (place exit up,right of open square)
	ldx #exit_up
	lda #4
	sta exitCols
	lda #3
	sta exitRows
	ldd #15	; vertical skip
	pshu d
	jsr copy_exit_data
	leau 2,u ; pop param
	rts
	
;find an open square and place the pattern
;down one and two left 
;valid x: 1 - 15 inclusive
;valid y: 1 - 15 inclusive
place_exit_left
	lda #1 ; min y 
	ldb #16 ; y range (1-16 inclusive)
	pshu d	
	lda #1 ; min x 
	ldb #15 ; x range (produces 1-15 inclusive)
	pshu d
	jsr get_rand_open
	leau 4,u  ; pop params
	leay -18,y  ; (place exit up,right of open square)
	ldx #exit_left
	lda #3
	sta exitCols
	lda #4
	sta exitRows
	ldd #16	; vertical skip
	pshu d
	jsr copy_exit_data
	leau 2,u ; pop param
	rts

;find an open square and place the pattern
;down one and one left 
;	.db 1,1,1
;	.db	1,2,1
;	.db	1,0,0
;	.db	1,1,1
place_exit_right
	lda #2 ; min y 
	ldb #16 ; y range (2-17 inclusive)
	pshu d	
	lda #3 ; min x 
	ldb #15 ; x range (produces 3-17 inclusive)
	pshu d
	jsr get_rand_open
	leay -41,y  ; -2*19-3 (
	ldx #exit_right
	lda #3
	sta exitCols
	lda #4
	sta exitRows
	ldd #16
	pshu d
	jsr copy_exit_data
	leau 2,u ; pop param
	rts
	
place_exit_down
	lda #3 ; min y 
	ldb #15 ; y range (3-17 inclusive)
	pshu d	
	lda #2 ; min x 
	ldb #16 ; x range (produces 2-17 inclusive)
	pshu d
	jsr get_rand_open
	leay -59,y  ; up three rows, left 2
	ldx #exit_down
	lda #4
	sta exitCols
	lda #3
	sta exitRows
	ldd #15 ; vskip when copying
	pshu d
	jsr copy_exit_data
	leau 2,u ; pop param
	rts
	
;copies a maze pattern into maze_data	
;exitRows set
;exitCols set
;u = vskip amount
;x contains address of pattern data
;y contains copy destination
copy_exit_data
	lda #0
@ol pshs a
	ldb #0
@il lda ,x+         ; copy a row
	sta ,y+
	incb
	cmpb exitCols
	bne @il
	;drop down in the maze data
	;leay 15,y
	tfr y,d  ; y-> d
	addd ,u
	tfr d,y ; d->y
	puls a ; restore loop counter
	inca 
	cmpa exitRows
	bne @ol
	rts
	
;start at top left, put monster in 1st open square
;registers saved
place_monster
	pshs d,y
	ldy #maze_data
	leay 20,y  ; skip top row of walls + 1st wall in row 2
	;leay 23,y  ; skip top row of walls + 1st wall in row 2
	;leay 80,y  ; for testing
@lp lda ,y+  ; find 1st open square
	cmpa #WALL
	beq @lp
	leay -1,y ; back up
	jsr move_monster_bits
	puls d,y
	rts

;copies one line of map data to the screen
;each "room" is 4 "pixels"  wide on the screen
;each line of the map needs to be copied 4 times to the screen
;to make the rooms square
;x = map line
;y = screen line (vram offset)
; d,y registers are preserved
draw_map_line
	pshs  d,x,y
	lda #0
@lp pshs a  ; save loop counter
	ldb #BLACK_FILL
	cmpx player_location
	bne @t
	leax 1,x ; x++
	ldb #BLUE_FILL ; draw player in blue
	bra @d ; draw
@t	lda ,x+ ; not player. Is it a visitted room
	;is it a wall? (if not, just leave it black)
	tst cheat
	beq @co  ; cheat off
	cmpa #WALL  ; uncomment line when cheating
	beq @s
	bra @w ; fill with white and draw
@co	anda #VISITTED_BIT ; sets z bit  
	beq @s
@w	ldb #WHITE_FILL ; four pixels of white
@d	stb ,y ; draw
@s	leay 1,y
	puls a  ; restore loop counter
	inca 
	cmpa #19 ; done?
	bne @lp
	puls d,x,y
	rts

;draw each line of map data four times to make a square	
draw_top_down
	;cls black
	lda #BLACK_FILL
	jsr cls
	ldx #maze_data
	ldy vramAddr  ; base offset of current buffer
	leay 520,y ; offset to middle of screen
	lda #0
@lp ldb #0
@il	jsr draw_map_line
	leay SCREEN_WIDTH_BYTES,y ; drop down on screen
	incb
	cmpb #8
	bne @il
	leax 19,x  ; drop down in map data
	inca
	cmpa #19
	bne @lp	
	rts

;teleport_monster
;moves the monster to a corner if stuck for too long
teleport_monster
@lp ;lda #1 ; min y 
	;ldb #17 ; y range (2-17 inclusive)
	ldd #$0211
	pshu d  ; x and y range are same	
	pshu d
	jsr get_rand_open	
	leau 4,u  ; pop params
	;remove monster from current location
	jsr move_monster_bits
	;too close?
	jsr get_monster_dist
	lda diff_sum
	cmpa #5
	bcs @lp
	;clear the monster_state
	clr monster_state
	rts
	
;cheat_on
;	ldx #$8101 ; cmpa #WALL
;	stx  cheat_poke 
;	rts

;cheat_off
;	ldx #$8408 ; anda #VISITTED_BIT
;	stx  cheat_poke 
;	rts
	
exit_up 
	.db 1,1,0,1
	.db	1,2,0,1
	.db	1,1,1,1

exit_right
	.db 1,1,1
	.db	1,2,1
	.db	1,0,0
	.db	1,1,1

exit_left
	.db 1,1,1
	.db	0,0,1
	.db	1,2,1
	.db	1,1,1
	
exit_down
	.db 1,1,1,1
	.db	1,2,0,1
	.db	1,1,0,1

