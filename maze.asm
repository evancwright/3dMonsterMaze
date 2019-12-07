;maze.asm
MAZE_SIZE EQU 361 ; size of maze data in bytes
START_OFFSET EQU 340  ; hex 154
SCREEN_WIDTH_BYTES EQU 32
TOP_DOWN_VSKIP EQU 13

;resets the maze and associated variables
make_maze
	pshs a,y
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


;sets y to a pointer in the maze
;x >= 2 and x <= 15
;y >= 2 and x <= 15
get_rand_open
@lp
	jsr rand
	pulu d
	anda #$0F
	inca 
	inca
	anda #$0F
	andb #$0F
	incb
	incb
	andb #$0F
	;now 2-15
	pshs a
	lda #19
	mul ; y * 19 -> d
	tfr d,y
	lda #0
	puls b ; pullx 
	pshs d  ; 0,x to top off stack
	tfr y,d  ; 
	addd ,s ; add x offset to coordinate3
	leas 2,s ; "pop it"
	tfr d,y
	leay maze_data,y
	lda ,y
	cmpa #EMPTY
	bne @lp
	rts
	
;place exit	
place_exit
;	jsr place_exit_up_left
	jsr place_exit_right
	rts
	
;find an open square and place the pattern
;down one and two left 
;valid x: 2 - 18 inclusive
;valid y: 1 - 15 inclusive
place_exit_up_left
	jsr get_rand_open
	leay 17,y  ; +19-2 (
	ldx #exit_up_left
	ldb #0
@l1	lda ,x+
	sta ,y+
	incb
	cmpb #4
	bne @l1
	;drop dest down one line in maze_data
	leay 15,y
	;copy 2nd row
	ldb #0
@l2	lda ,x+
	sta ,y+
	incb
	cmpb #4
	bne @l2
	;drop dest down one line in maze_data
	leay 15,y
	;copy 3rd row
	ldb #0
@l3	lda ,x+
	sta ,y+
	incb
	cmpb #4
	bne @l3	
	rts

;find an open square and place the pattern
;down one and one left 
;valid x: 1 - 15 inclusive
;valid y: 1 - 15 inclusive	
place_exit_right
	jsr get_rand_open
	leay -35,y  ; +19-2 (
	ldx #exit_right
	ldb #0
@l1	lda ,x+
	sta ,y+
	incb
	cmpb #3
	bne @l1
	;drop dest down one line in maze_data
	leay 15,y
	;copy 2nd row
	ldb #0
@l2	lda ,x+
	sta ,y+
	incb
	cmpb #3
	bne @l2
	;drop dest down one line in maze_data
	leay 15,y
	;copy 3rd row
	ldb #0
@l3	lda ,x+
	sta ,y+
	incb
	cmpb #3
	;fourth row
	leay 15,y
	ldb #0
@l4	lda ,x+
	sta ,y+
	incb
	cmpb #3
	bne @l2
	bne @l3	
	rts
	
	
;start at top left, put monster in 1st open square
;registers saved
place_monster
	pshs d,y
	ldy #maze_data
	leay 21,y  ; skip top row of walls + 1st wall in row 2
@lp lda ,y+  ; find 1st open square
	cmpa #WALL
	beq @lp
	ora #MONSTER_BIT
	leay -1,y ; back up
	sta ,y ; write monster back to maze
	sty monster_location
	jsr set_monster_xy
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
	cmpx player_location
	bne @t
	leax 1,x
	ldb #BLUE_FILL
	bra @d ; draw
@t	lda ,x+ ; get a room from the map
	;is it a wall? (if not, just leave it black)
	cmpa #WALL
	beq @s
	ldb #WHITE_FILL ; four pixels of white
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

exit_up_left 
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
	
exit_down_left
	.db 1,1,1,1
	.db	1,2,0,1
	.db	1,1,0,1

exit_down_right
	.db 1,1,1,1
	.db	1,0,2,1
	.db	1,0,1,1

