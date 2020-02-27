;game_code
;PARAMS FOR DRAWSPRITE
; since that's how many bytes d,x,y pushes/pulls
; a = screen x in bytes (units of 4 pixels)
; b = screen y in pixels
; ,u = height (in pixels)
; 1,u = width (in bytes = units of 4 pixels)
; y = sprite src

EMPTY EQU 0
WALL EQU 1
EXIT_MASK EQU 2
MONSTER_MASK EQU 4
MONSTER_BIT EQU 4
VISITTED_BIT EQU 8 
CLEAR_MONSTER_MASK EQU 251 ; FBh
CLEAR_BITS EQU 1
 
TICKS_PER_UPDATE EQU 1024 ; 2048
TICKS_PER_UPDATE_FAST EQU 768 ; 1024
 
IDLE EQU 0		; lies in wait
CHASING EQU 1	; sees player

AHEAD EQU 0
TO_SIDE EQU 1
BEHIND EQU 2

WALL_HEIGHT EQU 168
WALL_2_LEFT_X EQU 1
WALL_3_LEFT_X EQU 7
WALL_4_LEFT_X EQU 10
WALL_5_LEFT_X EQU 12
WALL_6_LEFT_X EQU 14
WALL_1_RIGHT_X EQU 31
WALL_2_RIGHT_X EQU 25
WALL_3_RIGHT_X EQU 22
WALL_4_RIGHT_X EQU 20
WALL_5_RIGHT_X EQU 18
WALL_6_RIGHT_X EQU 16


WALL_1_WIDTH EQU 1
WALL_2_WIDTH EQU 6
WALL_3_WIDTH EQU 3
WALL_4_WIDTH EQU 2
WALL_5_WIDTH EQU 2

FRONT_1_WIDTH EQU 30
CHECKER1 EQU 51
CHECKER2 EQU 204


	
MAZE_WIDTH  EQU  19
MAZE_HEIGHT EQU  19

;offsets for looking up or 'north'
LEFT_TILE  EQU  -1
ONE_UP_LEFT  EQU  -(MAZE_WIDTH)-1
TWO_UP_LEFT  EQU  -(2*MAZE_WIDTH)-1
THREE_UP_LEFT  EQU  -(3*MAZE_WIDTH)-1
FOUR_UP_LEFT  EQU  -(4*MAZE_WIDTH)-1
FIVE_UP_LEFT  EQU  -(5*MAZE_WIDTH)-1

RIGHT_TILE  EQU  1
ONE_UP_RIGHT  EQU  -(MAZE_WIDTH)+1
TWO_UP_RIGHT  EQU  -(2*MAZE_WIDTH)+1
THREE_UP_RIGHT  EQU  -(3*MAZE_WIDTH)+1
FOUR_UP_RIGHT  EQU  -(4*MAZE_WIDTH)+1
FIVE_UP_RIGHT  EQU  -(5*MAZE_WIDTH)+1
 

;offsets for looking right or east
UP_TILE  EQU  -MAZE_WIDTH
RIGHT_UP  EQU  -(MAZE_WIDTH)+1
TWO_RIGHT_UP  EQU  -(MAZE_WIDTH)+2
THREE_RIGHT_UP  EQU  -(MAZE_WIDTH)+3
FOUR_RIGHT_UP  EQU  -(MAZE_WIDTH)+4
FIVE_RIGHT_UP  EQU  -(MAZE_WIDTH)+5

DOWN_TILE  EQU  MAZE_WIDTH
RIGHT_DOWN EQU MAZE_WIDTH+1
TWO_RIGHT_DOWN  EQU  (MAZE_WIDTH+2)
THREE_RIGHT_DOWN  EQU (MAZE_WIDTH+3)
FOUR_RIGHT_DOWN  EQU  (MAZE_WIDTH+4)
FIVE_RIGHT_DOWN  EQU  (MAZE_WIDTH+5)

;offsets for looking left or 'west'
LEFT_UP  EQU  -(MAZE_WIDTH+1)
TWO_LEFT_UP  EQU  -(MAZE_WIDTH+2)
THREE_LEFT_UP  EQU  -(MAZE_WIDTH+3)
FOUR_LEFT_UP  EQU  -(MAZE_WIDTH+4)
FIVE_LEFT_UP  EQU  -(MAZE_WIDTH+5)

LEFT_DOWN  EQU   (MAZE_WIDTH-1)
TWO_LEFT_DOWN  EQU   (MAZE_WIDTH-2)
THREE_LEFT_DOWN  EQU (MAZE_WIDTH-3)
FOUR_LEFT_DOWN  EQU  (MAZE_WIDTH-4)
FIVE_LEFT_DOWN  EQU  (MAZE_WIDTH-5)

;offsets for looking south or down

DOWN_LEFT EQU (MAZE_WIDTH-1)
TWO_DOWN_LEFT EQU (2*MAZE_WIDTH-1)
THREE_DOWN_LEFT EQU (3*MAZE_WIDTH-1)
FOUR_DOWN_LEFT EQU (4*MAZE_WIDTH-1)
FIVE_DOWN_LEFT EQU (5*MAZE_WIDTH-1)

DOWN_RIGHT EQU (MAZE_WIDTH+1)
TWO_DOWN_RIGHT EQU (2*MAZE_WIDTH+1)
THREE_DOWN_RIGHT EQU (3*MAZE_WIDTH+1)
FOUR_DOWN_RIGHT EQU (4*MAZE_WIDTH+1)
FIVE_DOWN_RIGHT EQU (5*MAZE_WIDTH+1)

ONE_ROWS_UP  EQU  MAZE_WIDTH
TWO_ROWS_UP  EQU  -2*MAZE_WIDTH
THREE_ROWS_UP  EQU  -3*MAZE_WIDTH
FOUR_ROWS_UP  EQU  -4*MAZE_WIDTH
TOP EQU 8
LADDER_HEIGHT EQU 145
LADDER_TOP EQU 16
STEP_SPACING EQU 10

;PORTAL_TOP EQU 64
PORTAL_Y EQU 1548 ; (64*32 +16) door 2 away
; PORTAL_Y EQU 712 ; (22*32 + 3) door 1 away

;clear 400-600 hex, then set default values
init_vars
	lda #0
	ldy #$400
@lp sta ,y+
	cmpy #$601
	bne @lp
	ldy #VRAM1
	sty vramAddr
	ldy #$0F0F ;
	sty cur_rand	;	.dw 0x0f0f
	; rand			.dw 0x0000
	lda #$80
	sta one_in_msb ; .db 0x80
	sta left_tap_mask 	.db 0x80 ; 1000 0000
	lda #$01
	sta right_tap_mask ; .db 0x01 ; 0000 0001
	lda #UP
	sta cursorDir
	ldy #TICKS_PER_UPDATE
	sty monsterTicks
	lda #8
	sta drawMap
	ldy #400 ; just put monster somewhere
	sty monster_location
	ldx #static1
	stx staticAddr
	rts 
 
;sets tiles when player is facing up	
set_tiles_up
	;left tiles
	ldx player_location
	lda LEFT_TILE,x
	sta left1_tile
	lda ONE_UP_LEFT,x
	sta left2_tile
	lda TWO_UP_LEFT,x
	sta left3_tile
 	lda THREE_UP_LEFT,x
	sta left4_tile
	lda FOUR_UP_LEFT,x
	sta left5_tile		
 	;right tiles
	lda RIGHT_TILE,x
	sta right1_tile
	lda ONE_UP_RIGHT,x
	sta right2_tile
	lda TWO_UP_RIGHT,x
	sta right3_tile
 	lda THREE_UP_RIGHT,x
	sta right4_tile
	lda FOUR_UP_RIGHT,x
	sta right5_tile
	;center tiles (looking up)
	lda -MAZE_WIDTH,x
	sta front1_tile
	lda -2*MAZE_WIDTH,x
	sta front2_tile
	lda -3*MAZE_WIDTH,x
	sta front3_tile
	lda -4*MAZE_WIDTH,x
	sta front4_tile
	lda -5*MAZE_WIDTH,x
	sta front5_tile
 	rts

;sets tiles when player is facing right	
set_tiles_right
	;left tiles
	ldx player_location
	lda UP_TILE,x
	sta left1_tile
	lda RIGHT_UP,x
	sta left2_tile
	lda TWO_RIGHT_UP,x
	sta left3_tile
 	lda THREE_RIGHT_UP,x
	sta left4_tile
	lda FOUR_RIGHT_UP,x
	sta left5_tile		
 	;right tiles
	lda DOWN_TILE,x
	sta right1_tile
	lda RIGHT_DOWN,x
	sta right2_tile
	lda TWO_RIGHT_DOWN,x
	sta right3_tile
 	lda THREE_RIGHT_DOWN,x
	sta right4_tile
	lda FOUR_RIGHT_DOWN,x
	sta right5_tile
	;center tiles (looking up)
	lda 1,x
	sta front1_tile
	lda 2,x
	sta front2_tile
	lda 3,x
	sta front3_tile
	lda 4,x
	sta front4_tile
	lda 5,x
	sta front5_tile
 	rts


;sets tiles when player is facing up	
set_tiles_left
	;left tiles
	ldx player_location
	lda DOWN_TILE,x
	sta left1_tile
	lda LEFT_DOWN,x
	sta left2_tile
	lda TWO_LEFT_DOWN,x
	sta left3_tile
 	lda THREE_LEFT_DOWN,x
	sta left4_tile
	lda FOUR_LEFT_DOWN,x
	sta left5_tile		
 	;right tiles
	lda UP_TILE,x
	sta right1_tile
	lda LEFT_UP,x
	sta right2_tile
	lda TWO_LEFT_UP,x
	sta right3_tile
 	lda THREE_LEFT_UP,x
	sta right4_tile
	lda FOUR_LEFT_UP,x
	sta right5_tile
	;center tiles (looking up)
	lda -1,x
	sta front1_tile
	lda -2,x
	sta front2_tile
	lda -3,x
	sta front3_tile
	lda -4,x
	sta front4_tile
	lda -5,x
	sta front5_tile
 	rts
	

;sets tiles when player is facing up	
set_tiles_down
	;left tiles
	ldx player_location
	lda RIGHT_TILE,x
	sta left1_tile
	lda RIGHT_DOWN,x
	sta left2_tile
	lda TWO_DOWN_RIGHT,x
	sta left3_tile
 	lda THREE_DOWN_RIGHT,x
	sta left4_tile
	lda FOUR_DOWN_RIGHT,x
	sta left5_tile		
 	;right tiles
	lda LEFT_TILE,x
	sta right1_tile
	lda DOWN_LEFT,x
	sta right2_tile
	lda TWO_DOWN_LEFT,x
	sta right3_tile
 	lda THREE_DOWN_LEFT,x
	sta right4_tile
	lda FOUR_DOWN_LEFT,x
	sta right5_tile
	;center tiles (looking up)
	lda MAZE_WIDTH,x
	sta front1_tile
	lda 2*MAZE_WIDTH,x
	sta front2_tile
	lda 3*MAZE_WIDTH,x
	sta front3_tile
	lda 4*MAZE_WIDTH,x
	sta front4_tile
	lda 5*MAZE_WIDTH,x
	sta front5_tile
 	rts


;draws the game	then flips the buffer
draw_tiles
	lda showMap ; sets z flag
	beq @d  ; draw
	jsr draw_top_down
	lbra @l ; flip buffer
	;clear the bottom of the screen to erase any previous teeth
@d	lda #WHITE_FILL
	pshu a
	lda #192-175 ; height
	pshu a
	lda #32 ; width (whole screen)
	pshu a
	lda #175 ;y 
	pshu a
	lda #0  ; x
	pshu a
	jsr fill_rect
;1st set of walls
	;left 1
	lda #CHECKER2 ; fill pattern
	pshu a
	lda left1_tile
	anda #WALL
	beq @wl1 ; 
	ldd #wall_1_bottom ;it's wall (walls are angled)
	pshu d
	ldd #wall_left_1
	bra @dl1
@wl1 ; it's a hall 
	ldd #hall_1_bottom ;it's hall  ; 
	pshu d
	ldd #hall_left_1
@dl1 ; draw left 1 away
	pshu d  ; save 2 bytes!
	ldy #256 ; 0bytes over 8 down
	jsr draw_wall_1
	;right 1  ( 0 tiles forward )
	lda #CHECKER1 ; fill pattern2
	pshu a
	lda right1_tile
	anda #WALL
	beq @wr1
	;it's a wall 
	ldd #wall_right_1_bottom ; (walls are angled)
	pshu d
	ldd #wall_right_1
	bra @dr1
@wr1 ; it's a hall
	ldd #hall_1_bottom
	pshu d
	ldd #hall_left_1
@dr1	; draw 1 right
	pshu d ; push 1st param
	ldy #287   ; offset 8 down 31 over
	jsr draw_wall_1
	;is the there a center wall?
@sk	lda front1_tile
	anda #CLEAR_BITS ; clear wumpus or exit
	beq @f1
	jsr draw_front1
	lbra @x
@f1
;second walls down	
	;left 2
 	lda left2_tile
	anda #WALL
	beq @l2
	jsr draw_wall_2_left
	bra @sl
@l2	
	jsr draw_hall_2_left
@sl
 	;right 2
 	lda right2_tile ; wall or hall?
	anda #WALL
	beq @r2
	jsr draw_wall_2_right
 	bra @sk1
@r2	 ; hall
	jsr draw_hall_2_right
;is the there a center wall?
@sk1	lda front2_tile
	anda #CLEAR_BITS ; clear wumpus or exit
	beq @f2
	jsr draw_front2
	lbra @x
;third walls down
@f2	;left 3
	ldy #hall_left_3
	lda left3_tile
	anda #WALL
	beq @l3
	ldy #wall_left_3
@l3	
	lda #WALL_3_WIDTH ; width
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_3_LEFT_X  ; x,y
	ldb #TOP
	jsr draw_sprite
	;right side
	lda #WALL_3_WIDTH ; width
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda right3_tile
	anda #WALL
	beq @r3
	lda #WALL_3_RIGHT_X  ; x,y
	ldb #TOP
	ldy #wall_left_3
	jsr draw_sprite_hflipped
	bra @sk2
@r3	 ; hall
	lda #WALL_3_RIGHT_X  ; x,y
	ldb #TOP
	ldy #hall_left_3
	jsr draw_sprite_hflipped	
;is the there a center wall?	
@sk2	lda front3_tile
	anda #CLEAR_BITS ; clear wumpus or exit
	beq @f3
	jsr draw_front3
	lbra @x
;fourth walls down
@f3	;left 4
	ldy #hall_left_4
	lda left4_tile
	anda #WALL
	beq @l4
	ldy #wall_left_4
@l4	
	lda #WALL_4_WIDTH ; width
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_4_LEFT_X  ; x,y
	ldb #TOP
	jsr draw_sprite	
	;right 4
	lda #WALL_4_WIDTH ; width
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda right4_tile
	anda #WALL
	beq @r4 
	lda #WALL_4_RIGHT_X  ; x,y
	ldb #TOP
	ldy #wall_left_4
	jsr draw_sprite_hflipped
	bra @sk4
@r4	;hall
	lda #WALL_4_RIGHT_X  ; x,y
	ldb #TOP
	;ldy #hall_right_4
	ldy #hall_left_4
	jsr draw_sprite_hflipped		
@sk4
	;is there a wall?
	lda front4_tile
	anda #CLEAR_BITS ; clear wumpus or exit
	beq @f4
	jsr draw_front4
	lbra @x 
;fifth walls
@f4	ldy #hall_left_5
	lda left5_tile
	anda #WALL
	beq @l5
	ldy #wall_left_5
@l5	
	lda #WALL_5_WIDTH ; width
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_5_LEFT_X  ; x,y
	ldb #TOP
	jsr draw_sprite	
	;right 4
	lda #WALL_5_WIDTH ; width
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda right5_tile
	anda #WALL ; wall or hall?
	beq @r5
	lda #WALL_5_RIGHT_X  ; x,y
	ldb #TOP
	ldy #wall_left_5
	jsr draw_sprite_hflipped
	bra @sk5
@r5	 ;hall
	lda #WALL_5_RIGHT_X  ; x,y
	ldb #TOP
	ldy #hall_left_5
	jsr draw_sprite_hflipped
	;is there a wall?
@sk5
	lda front5_tile
	anda #CLEAR_BITS ; clear wumpus or exit
	beq @f5
	jsr draw_front5
	lbra @x
@f5 ;fill with a white rect
	ldy vramAddr
	leay WALL_6_LEFT_X,y
	lda #28 ; skip
	pshu a
	lda #168+TOP ; how many
	pshu a
	lda #4 ; len
	pshu a
	jsr draw_white_lines
@x	jsr draw_monster_state
	;more drawing
	jsr overlay_monster
	jsr draw_player_direction
	lda front1_tile
	anda #EXIT_MASK
	beq @l
	jsr draw_exit1
@l	;draw map help
	lda drawMap
	beq @nm
	dec drawMap
	ldd #$060E  ; 12 x 6 
	pshu d
;	lda #11  ; x,y
;	ldb #185
	ldd #$0BB9 ; 11-185
	ldy #map_help
	jsr draw_sprite	
@nm	jsr flip_buffer	
	rts
	
;draws the text over the view	
draw_monster_state
	jsr get_monster_dist
	jsr set_monster_orientation
	;clear the previous state
	lda #WHITE_FILL
	pshu a
	lda #TOP ; height
	pshu a
	lda #32 ; width
	pshu a
	lda #0 ;y 
	pshu a
	lda #0  ; x
	pshu a
	jsr fill_rect	
	;draw first sprite
	lda monster_state
	cmpa #IDLE
	bne @ns
	inc turnsStuck
	jsr draw_in_wait
	lbra @x 
@ns ;dist > 8  ; not stuck
	lda diff_sum
	cmpa #8
	bhi @x ; too far
	cmpa #1
	lbeq @x ; player will see teeth
	cmpa #6
	bls @cl ; close
	jsr draw_hunting_you ; 7 or 8
;	jsr draw_footsteps_approaching
	lbra @x
@cl ;test seen (0-6 and l-o-s)
	tst player_seen
	beq @fs ; not seen - print footsteps msg
	lda monster_orientation
	;is rex to side
	cmpa #TO_SIDE
	bne @bh
	jsr draw_rex_beside
	bra @x	;is rex behind?
@bh	cmpa #BEHIND
	bne @sn
	jsr draw_rex_behind
	bra @x
@sn	jsr draw_player_seen
	bra @x
@fs	jsr draw_footsteps_approaching
@x	rts

;draws the escape ladder
; draw_exit1
	; ldx vramAddr 
	; tfr x,y
	; leax 333,x ; (LADDER_TOP*32 +18)
	; leay 338,y ; (LADDER_TOP*32 +18)
	; ldd #0
; @lp pshs a
	; lda #BLACK_FILL
	; sta ,x
	; sta ,y
	; incb 
	; cmpb #STEP_SPACING
	; bne @s
	; sta 1,x ; write the fill pattern to screen
	; sta 2,x
	; sta 3,x
	; sta 4,x 
	; ldb #0 ; reset step counter
; @s	leax 32,x
	; leay 32,y
	; puls a
	; inca
	; cmpa #LADDER_HEIGHT
	; bne @lp
	; rts

draw_exit1

;	jsr draw_front1

	ldy vramAddr
	;leay 333,y ; (LADDER_TOP*32 +18)
	leay PORTAL_Y,y ; (PORTAL_TOP*32 +16)
	
	ldd #32
	pshu d
	jsr randmod
	pulu d 	
	ldx #static1
	abx

	;ldb #LADDER_HEIGHT
	ldb #99  ; door 2 away
	;ldb #150 ; door 1 away
@lp pshs b ; loop counter
	;get a random line
	pshu x ; re-push x
	ldd #8 ; 6 bytes wide (2 away)
	; ldd #16 ; 16 bytes wide (1 away)
	pshu d	
	lda #1 ; one line
	pshu a
	jsr draw_line
	cmpx #end_static
	blo @s
	ldd #32
	pshu d
	jsr randmod
	pulu d 	
	ldx #static1
	abx
@s	puls b ; pop loop counter
	decb 
	bne @lp
	rts
	
; draw_front1
	; ;each line is 30
	; ldy vramAddr
	; leay WALL_2_LEFT_X,y
	; lda #2
	; pshu a
	; lda #4+TOP ; 4 lines
	; pshu a	
	; lda #30 ; 30 long
	; pshu a
	; jsr draw_white_lines ; 4 lines of white
	; ;29 alternating (CHECKER1) 51 and (CHECKER2)204 line
	; lda #0
	; ldb #CHECKER1
; @ol	pshs a ; save loop counter
 	; lda #0
; @l1	stb ,y+  ; 1st line
	; inca
	; cmpa #30  ; draw 30 chars
	; bne @l1
	; leay 2,y ; skip to next line
	; comb  ; flip byte to draw to make checkered pattern
	; puls a
    ; inca 
	; cmpa #158
	; bne @ol
	; ;one line of 51
	; ldb #CHECKER1
 	; lda #0
; @l3	stb ,y+  ; 1st line
	; inca
	; cmpa #30
	; bne @l3
	; leay 2,y ; skip to next line

	; ;line of black
	; ldb #0
 	; lda #0
; @l4	stb ,y+  ; 1st line
	; inca
	; cmpa #30
	; bne @l4
	; leay 2,y ; skip to next line	
	; ;4 lines of white (255)
	; lda #2
	; pshu a
	; lda #4 ; how many
	; pshu a
	; lda #30 ; len
	; pshu a
	; jsr draw_white_lines
	; ;now draw left and right black lines
	; ldy #385 ; (12*32)+1
	; lda #158
	; jsr draw_left_edge
	; ;draw rt and right black lines
	; ldy #414 ; (12*32)+31
	; lda #160
	; jsr draw_right_edge
	; ;draw top black line
	; ldd #385
	; addd vramAddr ;
	; tfr d,y
	; ldd #0
; @l	sta ,y+
	; incb
	; cmpb #30
	; bne @l
	; rts

; draw_front2
	; ;each line is 30
	; ldy vramAddr
	; leay WALL_3_LEFT_X,y
	; ;  alternating 51 and 204 line
	; ;4 lines of white (255)
	; lda #14 ; skip
    ; pshu a
	; lda #28+TOP ; how many (top = 8)
	; pshu a
	; lda #18 ; len
	; pshu a
	; jsr draw_white_lines ; 4 lines of white
	; ;checkered lines
	; lda #14 ; skip amount
	; pshu a
	; lda #56 ; how many pairs
	; pshu a
	; lda #18 ; len
	; pshu a	
	; jsr draw_checkered_lines
 	; ;line of black
	; ldb #0
 	; lda #0
; @l4	stb ,y+  ; 1st line
	; inca
	; cmpa #18
	; bne @l4
	; leay 14,y
	; ;23 lines of white (255)
	; lda #14 ; skip amount
	; pshu a
	; lda #23 ; how many
	; pshu a
	; lda #18 ; len
	; pshu a
	; jsr draw_white_lines ; 4 lines of white
	; ;now draw left and right black lines
	; ldy #1159 ; (20*32)+6
	; lda #113
	; jsr draw_left_edge
	; ;draw rt and right black lines
	; ldy #1176 ;  
	; lda #113
	; jsr draw_right_edge	
	; ;draw top black line
	; ldd #1159
	; addd vramAddr ;
	; tfr d,y
	; ldd #0
; @l	sta ,y+
	; incb
	; cmpb #18
	; bne @l
	; rts

; draw_front3
	; ;each line is 30
	; ldy vramAddr
	; leay WALL_4_LEFT_X,y
	; ;  alternating 51 and 204 line
	; ;white lines
	; lda #20 ; skip
    ; pshu a
	; lda #40+TOP ; how many
	; pshu a
	; lda #12 ; len
	; pshu a
	; jsr draw_white_lines ; 4 lines of white
	; ;checkered lines
	; lda #20 ; skip amount
	; pshu a
	; lda #44 ; how many pairs
	; pshu a
	; lda #12 ; len
	; pshu a	
	; jsr draw_checkered_lines
 	; ;line of black
	; ldb #0
 	; lda #0
; @l4	stb ,y+  ; 1st line
	; inca
	; cmpa #12
	; bne @l4
	; leay 20,y
	; ;4 lines of white (255)
	; lda #20 ; skip amount
	; pshu a
	; lda #39 ; how many
	; pshu a
	; lda #12 ; len
	; pshu a
	; jsr draw_white_lines
	; ;now draw left and right black lines
	; ldy #1546 ;  
	; lda #88
	; jsr draw_left_edge
	; ;now draw right black line
	; ldy #1558 ;  
	; lda #88
	; jsr draw_left_edge
	; ;draw top black line
	; ldd #1546
	; addd vramAddr ;
	; tfr d,y
	; ldd #0
; @l	sta ,y+
	; incb
	; cmpb #12
	; bne @l
	; rts


; draw_front4
	; ;each line is 30
	; ldy vramAddr
	; leay WALL_5_LEFT_X,y
	; ;  alternating 51 and 204 line
	; ;white lines
	; lda #24 ; skip
    ; pshu a
	; lda #48+TOP ; how many
	; pshu a
	; lda #8 ; len
	; pshu a
	; jsr draw_white_lines ; 4 lines of white
	; ;checkered lines
	; lda #24 ; skip amount
	; pshu a
	; lda #36 ; how many pairs
	; pshu a
	; lda #8 ; len
	; pshu a	
	; jsr draw_checkered_lines
 	; ;line of black
	; ldb #0
 	; lda #0
; @l4	stb ,y+  ; 1st line
	; inca
	; cmpa #8
	; bne @l4
	; leay 24,y
	; ;4 lines of white (255)
	; lda #24 ; skip amount
	; pshu a
	; lda #47 ; how many
	; pshu a
	; lda #8 ; len
	; pshu a
	; jsr draw_white_lines ; 4 lines of white
	; ;draw left vertical line
	; ldy #1836 ;  
	; lda #72
	; jsr draw_left_edge	
	; ;draw right vertical line
	; ldy #1812 ;  
	; lda #73
	; jsr draw_left_edge
	; ;draw top edge
	; ldd #1804 ;  
	; addd vramAddr
	; tfr d,y
	; lda #0
	; ldb #0
; @l	sta ,y+
	; incb
	; cmpb #8
	; bne @l
	; rts	
	
  	
; draw_front5
	; ;each line is 30
	; ldy vramAddr
	; leay WALL_6_LEFT_X,y
	; ;  alternating 51 and 204 line
	; ;white lines
	; lda #28 ; skip
    ; pshu a
	; lda #56+TOP ; how many
	; pshu a
	; lda #4 ; len
	; pshu a
	; jsr draw_white_lines ; 4 lines of white
	; ;checkered lines
	; lda #28 ; skip amount
	; pshu a
	; lda #28 ; how many pairs
	; pshu a
	; lda #4 ; len
	; pshu a	
	; jsr draw_checkered_lines
 	; ;line of black
	; ldb #0
 	; lda #0
; @l4	stb ,y+  ; 1st line
	; inca
	; cmpa #4
	; bne @l4
	; leay 28,y
	; ;4 lines of white (255)
	; lda #28 ; skip amount
	; pshu a
	; lda #55 ; how many
	; pshu a
	; lda #4 ; len
	; pshu a
	; jsr draw_white_lines ; 4 lines of white
	; ;draw left edge
	; ldy #2062 ;  
	; lda #57
	; jsr draw_left_edge	
	; ;draw right edge
	; ldy #2065 ;  
	; lda #57
	; jsr draw_right_edge		
	; ;top line
	; ldd #2062
	; addd vramAddr
	; tfr d,y
	; lda #0
	; sta ,y+
	; sta ,y+
	; sta ,y+
	; sta ,y+
	; rts	

	
;draws 4 white lines 
;(how many, len, skip amount)
;len is pushed 1st
;how many pushed 2nd
;x contains skip amount
draw_white_lines
	lda #0
@ol	pshs a ; save loop counter
;	ldb #255
;	lda #0
	ldd #$00FF
@l1	stb ,y+  ; 1st line
	inca
	cmpa ,u
	bne @l1
	ldb 2,u
	tfr y,x
	abx 
	tfr x,y
	puls a
    inca 
	cmpa 1,u
	bne @ol
	leau 3,u ; pop params
	rts	


;draws pairs of checkered lines
;(how many, len, skip amount)
;len is pushed 1st
;how many pushed 2nd
;x contains skip amount
draw_checkered_lines
	lda #0
	ldb #CHECKER1
@ol	pshs a ; save loop counter
 	lda #0  ; inner loop counter
@l1	stb ,y+  ; 1st line
	inca
	cmpa ,u
	bne @l1
	pshs b
	ldb 2,u ; jump down a line
	tfr y,x
	abx 
	tfr x,y
	puls b
	comb  ; flip checkered byte
 	lda #0  ; 2nd line
@l2	stb ,y+   
	inca
	cmpa ,u
	bne @l2
	pshs b
	ldb 2,u ; jump down a line
	tfr y,x
	abx 
	tfr x,y	
	puls b
	comb
	puls a ; restore outer loop counter
    inca 
	cmpa 1,u
	bne @ol
	leau 3,u ; pop params
	rts	
	
turn_left
	lda direction
	deca
	cmpa #255 
	bne	@s
	lda #RIGHT		
@s	sta direction
	jsr set_tiles
	jsr draw_tiles
	rts
	
turn_right
	lda direction
	inca
	cmpa #RIGHT+1 
	bne	@s
	lda #0		
@s	sta direction
	jsr set_tiles
	jsr draw_tiles
	rts

set_tiles
	lda direction
	cmpa #UP
	bne @s1
	jsr set_tiles_up
	bra @x
@s1 cmpa #DOWN
	bne @s2
	jsr set_tiles_down
	bra @x
@s2 cmpa #LEFT
	bne @s3
	jsr set_tiles_left
	bra @x
@s3 jsr set_tiles_right
@x	rts

;
move_fwd
	lda front1_tile
	cmpa #1
	beq @f
	ldx player_location
	lda direction
	cmpa #UP
	bne @s1
	leax -MAZE_WIDTH,x
	bra @x
@s1 cmpa #DOWN
	bne @s2
	leax MAZE_WIDTH,x
	bra @x
@s2 cmpa #LEFT
	bne @s3
	leax -1,x
	bra @x
@s3 leax 1,x
@x	stx player_location
	;is player at end exit?
	lda ,x
	anda #EXIT_MASK
	beq @d
	jsr draw_escaped
	jsr flip_buffer
	jsr waste_time
	jsr draw_escaped
	;draw "this time..."
	ldd #$0706 ; 12 x 108
	pshu a 
	pshu b
	ldd #$0D6C 
	ldy #this_time_sprite
	jsr draw_sprite
	jsr flip_buffer
;	jsr draw_title  ; waits for key press, then resets
	jsr waste_time
	jsr reset_game
	lda #WHITE_FILL
	jsr cls
@d	jsr set_player_xy
	jsr set_tiles
	jsr draw_tiles
	ldy player_location
	cmpy monster_location
	bne @f
	jsr do_death_screen
@f	rts
	
;overlay wumpus
overlay_monster
	;if monster is one square away, draw it
	ldy player_location
	lda 1,y
	anda #MONSTER_MASK
	bne @dm1
	lda -1,y
	anda #MONSTER_MASK
	bne @dm1
	lda MAZE_WIDTH,y
	anda #MONSTER_MASK
	bne @dm1
	lda -MAZE_WIDTH,y
	anda #MONSTER_MASK
	bne @dm1
	bra @w2
@dm1	; draw monster 1 square away
	jsr draw_monster1 ; teeth
	bra @x
@w2 lda front1_tile
	anda #WALL
	cmpa #1
	beq @x  ; bail if wall in front of player
	lda front2_tile
	tfr a,b 
	anda #WALL
	bne @x
	tfr b,a 
	anda #MONSTER_MASK
	beq @w3
	jsr draw_monster2
	bra @x
@w3	lda front3_tile
	tfr a,b
	anda #WALL
	bne @x
	tfr b,a
	anda #MONSTER_MASK
	beq @w4
	jsr draw_monster3
	bra @x
@w4 lda front4_tile
	tfr a,b
	anda #WALL
	bne @x
	tfr b,a
	anda #MONSTER_MASK
	beq @x	
 	jsr draw_monster4
@w5 lda front5_tile
	tfr a,b
	anda #WALL
	bne @x
	tfr b,a
	anda #MONSTER_MASK
	beq @x	
 	jsr draw_monster4
@x	rts

;draw wumpus 4 squares away
;this never gets called!
;draw_monster5
;	rts

;draw wumpus 3 squares away
draw_monster4
	lda #04 ; width
	pshu a
	lda #56 ; height
	pshu a
	lda #14  ; x,y
	ldb #68 + TOP
	;ldb #71 + TOP
	ldy #monster4_mask
	jsr draw_mask
	leau -2,u ; repush params
	ldy #monster4_data
	jsr or_sprite	
	rts

;draw wumpus 3 squares away
draw_monster3
	lda #4 ; width
	pshu a
	lda #72 ; height
	pshu a
	lda #14  ; x,y
	;ldb #56 + TOP
	ldb #62 + TOP
	ldy #monster3_mask
	jsr draw_mask
	leau -2,u
	ldy #monster3_data
	jsr or_sprite
	rts

	
;draw wumpus 2 squares away
draw_monster2
	lda #7 ; width
	pshu a
	lda #96 ; height
	pshu a
	lda #12  ; x,y
	ldb #42+TOP
	ldy #monster2_mask
	jsr draw_mask
	leau -2,u  ; repush params
	ldy #monster2_data
	jsr or_sprite	
	rts

;draw monster 1 squares away
;overlays teeth on the screen
draw_monster1
	;;;;;;;;;;;;;;;;;;;;;;upper teeth;;;;;;;;;;;;;;;;;;
	;curved tooth
	lda #2
	ldb #0
	ldx #orange_tooth_data
	pshu x
	ldx #orange_tooth_mask
	pshu x
	jsr mask_tile_2
	;curved tooth
	lda #3
	ldb #0
	ldx #curved_tooth_data
	pshu x
	ldx #curved_tooth_mask
	pshu x
	jsr mask_tile_2
	;file in rest with black tiles
	lda #4
	ldb #0
@lp	
	jsr set_draw_offset
	ldx #black_tile
	jsr draw_tile
	inca 
	cmpa #8
	bne @lp
	;second row of top teeth;;;;;;;;;;;;;;;;;
	;curved tooth
	lda #4
	ldb #1
	ldx #orange_tooth_data
	pshu x
	ldx #orange_tooth_mask
	pshu x
	jsr mask_tile_2
	;curved tooth
	lda #5
	ldb #1
	ldx #curved_tooth_data
	pshu x
	ldx #curved_tooth_mask
	pshu x
	jsr mask_tile_2
	;black tiles
	lda #6
	ldb #1
	jsr set_draw_offset
	ldx #black_tile
	jsr draw_tile
	;black tiles
	lda #7
	ldb #1
	jsr set_draw_offset
	ldx #black_tile
	jsr draw_tile
	;3rd row of top teeth
	lda #6
	ldb #2
	ldx #orange_tooth_data
	pshu x
	ldx #orange_tooth_mask
	pshu x
	jsr mask_tile_2
	;curved top
	lda #7
	ldb #2
	ldx #curved_tooth_data
	pshu x
	ldx #curved_tooth_mask
	pshu x
	jsr mask_tile_2
	;;;;;;;;;;;;;;;;;;;;;;lower teeth;;;;;;;;;;;;;;;;;;
	;curved tooth
	lda #0
	ldb #7
	;jsr draw_tile
	ldx #curved_tooth_up_data
	pshu x
	ldx #curved_tooth_up_mask
	pshu x
	jsr mask_tile_2
	;tooth
	lda #1
	ldb #7
	jsr set_draw_offset
	ldx #orange_tooth_up_data
	pshu x
	ldx #orange_tooth_up_mask
	pshu x
	jsr mask_tile_2
	rts

update_monster
	lda turnsStuck
	cmpa #20
	bne @g
	jsr teleport_monster
@g	ldy #TICKS_PER_UPDATE ; set monster to slow speed
	sty monsterTicks
	lda monster_state ; prev_state = state
	sta prev_state
	lda #IDLE
	sta monster_state
	ldy #0
	lda #0 ;clear player seen
	sta player_seen
	sty ticks
	;move monster toward player if seen ; sets state to CHASING
	jsr check_see_player_left 
	tstb
	bne @d
	jsr check_see_player_right
	tstb
	bne @d
	jsr check_see_player_up
	tstb
	bne @d
	jsr check_see_player_down
	tstb
	bne @d
	tst player_seen
	bne @d  ;  great, we're chasing player, done 
	jsr update_monster2  ; move monster
	bra @e 
@d	ldy #TICKS_PER_UPDATE_FAST ; speed up
	sty monsterTicks
@e	ldy player_location
	cmpy monster_location
	bne @s
	jsr do_death_screen
@s	rts

;the algorithm from the zx81 dissasembly
update_monster2
	;try to move along the greater of the two axes toward the player
	leas -1,s ; room for local
	ldy monster_location
	lda monster_x
	suba player_x
	jsr absa
 	sta ,s ;
	lda monster_y
	suba player_y
	jsr absa
	cmpa ,s ; compare |dy| to |dx|
	bcs @v 
	; try move left / right first
	jsr try_left_right
	stb monster_state
	cmpb #1
	beq @x
	jsr try_up_down
	stb monster_state
	bra @x
@v	; try move up / down first
	jsr try_up_down
	stb monster_state
	cmpb #1
	beq @x
	jsr try_left_right
	stb monster_state	
@x	leas 1,s ; pop local
	rts

;result in b
try_left_right
   ; try ;left / right
	ldy monster_location
	lda monster_x  
	cmpa player_x
	beq @f ; if x's are same, then can't move
	bcs @r
	;playerx <= monsterx
	lda -1,y  ; wall?
	cmpa #1
	beq @f ; can't move left
	;move left
	lda #LEFT
	jsr move_monster
	bra @s
@r  ; playerx > monsterx
	lda 1,y  ; wall?
	cmpa #1
	beq @f ; can't move right
	;move right	 
	lda #RIGHT
	jsr move_monster
	bra @s
@f	ldb #0
	bra @x
@s	ldb #1
@x	rts	

;result in b
try_up_down
	ldy monster_location
	lda monster_y  
	cmpa player_y
	beq @f  ; if y's are same, then can't move
	bcs @d
	;player is above monster, try move up
	lda -MAZE_WIDTH,y  ; wall?
	cmpa #1
	beq @f ; can't move
	lda #UP
	jsr move_monster	
	bra @s
@d	;player is above monster, try move down
	lda MAZE_WIDTH,y  ; wall?
	cmpa #1
	beq @f ; can't move
	lda #DOWN
	jsr move_monster
	bra @s
@f	ldb #0
	bra @x
@s  ldb #1
@x	rts

;returns |a| in a 
absa
	tsta 
	bpl @x
	coma
	inca
@x	rts

;move monster up,down,left,right
;a contains direction  (UP,DOWN,LEFT,RIGHT)
move_monster
	ldy monster_location
	;clear monster stuck
	clr turnsStuck
	;move monster
	;rts ; HACK HACK HACK FOR TESTING
	cmpa #UP
    bne	@d
	leay -MAZE_WIDTH,y
	bra @m
@d	cmpa #DOWN
    bne	@l
	leay MAZE_WIDTH,y
	bra @m
@l	cmpa #LEFT
	bne	@r
	leay -1,y
	bra @m
@r	leay 1,y  ; must have been right
@m	jsr move_monster_bits
	rts

;y = new location
move_monster_bits	
	;clear monster bit
	ldx monster_location 
	lda ,x
	anda #CLEAR_MONSTER_MASK
	sta ,x
	;set new monster bit
	sty monster_location
	lda ,y
	ora #MONSTER_MASK
	sta ,y
	jsr set_monster_xy
	rts
	
;sets player x,y and marks the square as visitted	
set_player_xy
	pshs a
	ldy  player_location
	lda ,y
	ora #VISITTED_BIT
	sta ,y
	jsr ptr_to_coords
	lda ycoord
	sta player_y
	lda xcoord
	sta player_x	
	puls a 
	rts

set_monster_xy
	ldy  monster_location
	jsr ptr_to_coords
	lda ycoord
	sta monster_y
	lda xcoord
	sta monster_x	
	rts
 
;sets xcoord and y coord based on ptr in y*
ptr_to_coords
	pshs d,x,y
	lda #0
	pshu a ; push local
	clr xcoord
	clr ycoord
	leay -maze_data,y
	tfr y,d
@lp cmpd #MAZE_WIDTH
	bcs @x
	subd #MAZE_WIDTH
	inc ,u
	bra @lp
@x  stb xcoord	
	lda ,u
	sta ycoord
	leau 1,u  ; pop local
	puls d,x,y 
	rts
	
do_death_screen
	ldx #game_over_tile_map
	jsr draw_tile_map
;;;;;;;;;;;;ANY KEY;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lda #12
	pshu a
	lda #6
	pshu a
	lda #10
	ldb #140
	ldy #press_a_key
	jsr draw_sprite
	jsr flip_buffer
	;wait for input
	jsr any_key
;	cmpa #'Y'
	; bra @r  ; disabled trying again
	ldy monster_location
	lda ,y
	anda #CLEAR_MONSTER_MASK ; clear monster bit
	sta ,y
;@r	jsr reset_game  ; brand new game
	jsr ask_retry
@x	rts

ask_retry
	lda attemptNumber
	bne @n
	lda #WHITE_FILL
	jsr cls
	ldy #try_again_sprite
	ldd #$060E
	pshu d
	lda #11  ; x,y
	ldb #96
	jsr draw_sprite
	jsr flip_buffer
@lp	jsr [POLCAT]
	beq @lp
	cmpa #'Y'
	beq @y
	cmpa #'N'
	beq @n
	bra @lp
@n	jsr reset_game	
	bra @x
@y	jsr retry_game
@x	rts

;just put player and moster at start
retry_game
	;inc attemptNumber
	lda attemptNumber
	inca 
	sta attemptNumber
	;clear the monster
	ldy monster_location
	lda ,y
	anda #CLEAR_MONSTER_MASK
	sta ,y
	jsr place_monster
	jsr place_player
	rts

;reinitializes all rooms and places
;player and hazards
reset_game
	clr attemptNumber
	lda #WHITE_FILL
	jsr cls
try_again
	jsr make_maze  ; carve out passages
	;put player back at bottom right,facing up
	jsr place_player
	;make sure player doesn't start at exit
	ldy player_location
	lda ,y
	anda #EXIT_MASK
	bne try_again
	lda -MAZE_WIDTH,y
	anda #EXIT_MASK
	bne try_again
	lda -1,y
	anda #EXIT_MASK
	bne try_again

	;place monster at top left
	jsr place_monster
	jsr set_tiles ; refresh what the player sees 
	rts

place_player
	ldy #START_OFFSET
	leay maze_data,y
	sty player_location
	lda #UP
	sta direction
	lda -MAZE_WIDTH,y 
	beq @h 	; if it's a hall (0), we're ok
	lda #LEFT
	sta direction
@h	jsr set_player_xy
	rts

draw_player_direction
	lda direction
	cmpa #UP
	bne @s
	ldy #compass_north
	bra @d
@s cmpa #DOWN
	bne @e
	ldy #compass_south
	bra @d
@e cmpa #LEFT
	bne @w
	ldy #compass_west
	bra @d
@w  ldy #compass_east	
@d	
;	lda #2 ; width
;	pshu a
;	lda #8
;	pshu a
	ldd #$0802
	pshu d
	lda #16  ; x,y
	ldb #175
	jsr draw_sprite
	rts
	
;y contains the screen location
;to start copying to
;	ldy #WALL_1
;draw_wall_1(top sprite, bottom sprite, pattern)
; 0,u contains top sprite addr
; 2,u contains bottom sprite addr
; 4,u contains pattern
draw_wall_1
	tfr y,d ; add vram offset
	addd vramAddr
	tfr d,y
	ldx ,u
	ldb #5  ; sprite is 5 tall?
@l1 lda ,x+
	sta ,y
	leay SCREEN_WIDTH_BYTES,y ;drop down one row
	decb
	bne @l1
;now draw the alternating pairs
	ldb #159 ; 159 lines
	lda 4,u  ; load pattern
@l2 sta ,y
	leay SCREEN_WIDTH_BYTES,y ;drop down one line
	coma
	decb
	bne @l2
;now draw the bottom
	ldx 2,u 
	ldb #4
@l3 lda ,x+
	sta ,y
	leay SCREEN_WIDTH_BYTES,y ;drop down one line
	decb	
	bne @l3
	leau 5,u ; pop params
	rts


draw_wall_2_left
	lda #WALL_2_WIDTH ; width
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_2_LEFT_X  ; x,y
	ldb #TOP
	ldy #wall_left_2
	jsr draw_sprite
 	rts

draw_wall_2_right
	lda #WALL_2_WIDTH ; width
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_2_RIGHT_X  ; x,y
	ldb #TOP
	ldy #wall_left_2
 	jsr draw_sprite_hflipped
 	rts
	
draw_hall_2_left
	ldd #WALL_2_LEFT_X
	pshs d
	lda #TOP
	ldb #32 ; screen width
	mul 
	addd ,s
	pshs d
	ldd vramAddr
	addd ,s
	tfr d,y
	leas 4,s
	;draw 5 lines of white (255)
	;drawline(number, len, pattern)
	ldx #white_line
	pshu x
	ldd #6
	pshu d
	lda #5
	pshu a
	jsr draw_line

	;draw 24 lines of 
	;.db 63,255,255,255,255,255
	;drawline(number, len, pattern)
	ldx #hall_2_left_edge
	pshu x
	ldd #6
	pshu d
	lda #24
	pshu a
	jsr draw_line
	
	;draw 1 lines of 
	;draw line of 0,0,0,0,0,0
	ldx #black_line
	pshu x
	ldd #6
	pshu d
	lda #1
	pshu a
	jsr draw_line
	
	;55 pairs offset	
	;.db 51,51,51,51,51,51
	;.db 12,204,204,204,204,204
	ldb #55
@lp 
	pshs b
    lda #51
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	leay SCREEN_WIDTH_BYTES-6,y ; drop down
	lda #12
	sta ,y+
	lda #204
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	leay SCREEN_WIDTH_BYTES-6,y ; drop down
	puls b
	decb
	lbne @lp
	
	;a line of zeros
	ldx #black_line
	pshu x
	ldd #6
	pshu d
	lda #1
	pshu a
	jsr draw_line
	
	;23 lines of 
	;.db 63,255,255,255,255,255
	ldx #hall_2_left_edge
	pshu x
	ldd #6
	pshu d
	lda #23
	pshu a
	jsr draw_line

	;7 lines of 
	;.db 255,255,255,255,255,255
	ldx #white_line
	pshu x
	ldd #6
	pshu d
	lda #7
	pshu a
	jsr draw_line
	
	rts
	
draw_hall_2_right
	ldd #WALL_2_RIGHT_X
	pshs d
	lda #TOP
	ldb #32
	mul
	addd ,s
	pshs d
	ldd vramAddr
	addd ,s
	tfr d,y
	leas 4,s	;draw 5 lines of white (255)
	;drawline(number, len, pattern)
	ldx #white_line
	pshu x
	ldd #6
	pshu d
	lda #5
	pshu a
	jsr draw_line

	;draw 24 lines of 
	;.db 63,255,255,255,255,255
	;drawline(number, len, pattern)
	ldx #hall_2_right_edge
	pshu x
	ldd #6
	pshu d
	lda #24
	pshu a
	jsr draw_line
	
	;draw 1 lines of 
	;draw line of 0,0,0,0,0,0
	ldx #black_line
	pshu x
	ldd #6
	pshu d
	lda #1
	pshu a
	jsr draw_line
	
	;55 pairs offset	
	;.db 51,51,51,51,51,51
	;.db 12,204,204,204,204,204
	ldb #55
@lp 
	pshs b
    lda #204  ; 51 -> 204
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	leay SCREEN_WIDTH_BYTES-6,y ; drop down
	lda #51 ; 204 -> 51
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	sta ,y+
	lda #48  ; 12 -> 48 
	sta ,y+
	leay SCREEN_WIDTH_BYTES-6,y ; drop down
	puls b
	decb
	bne @lp
	
	;a line of zeros
	ldx #black_line
	pshu x
	ldd #6
	pshu d
	lda #1
	pshu a
	jsr draw_line
	
	;23 lines of 
	;.db 255,255,255,255,255,252
	ldx #hall_2_right_edge
	pshu x
	ldd #6
	pshu d
	lda #23
	pshu a
	jsr draw_line

	;7 lines of 
	;.db 255,255,255,255,255,255
	ldx #white_line
	pshu x
	ldd #6
	pshu d
	lda #7
	pshu a
	jsr draw_line

 	rts

;figures out the horizontal,vertical,and sum distance
;from the player to the monster and stores them in 
;global variables
get_monster_dist
	lda monster_x
	suba player_x
	jsr absa
 	sta diff_x
	tfr a,b
	lda monster_y
	suba player_y
	jsr absa 
	sta diff_y
	adda diff_x
	sta diff_sum
	rts

draw_rex_behind
	ldy #behind_you_sprite 
	lda #18 ; width in bytes
	pshu a
	lda #6 ; height in pixels
	pshu a
;	lda #10  ; x in bytes , y in pixels
;	ldb #0
	ldd #$0700
	jsr draw_sprite
	rts
	
draw_rex_beside
 	;draw next to sprite
	ldy #beside_you_sprite
	lda #17 ; width in bytes
	pshu a
	lda #6 ; height in pixels
	pshu a
;	lda #6  ; x in bytes , y in pixels
;	ldb #0
	ldd #$0700
	jsr draw_sprite	
	rts
	
draw_player_seen
	ldy #player_seen_sprite
	lda #13 ; width in bytes
	pshu a
	lda #6 ; height in pixels
	pshu a
;	lda #9  ; x in bytes , y in pixels
;	ldb #0
	ldd #$0900
	jsr draw_sprite
	rts
	
draw_footsteps_approaching
	ldy #footsteps_sprite ; idle
	lda #19 ; width in bytes
	pshu a
	lda #6 ; height in pixels
	pshu a
;	lda #7  ; x in bytes , y in pixels
;	ldb #0
	ldd #$0700	
	jsr draw_sprite
	rts

draw_in_wait
	ldy #lies_in_wait_sprite ; couldn't move
	lda #13 ; width in bytes
	pshu a
	lda #6 ; height in pixels
	pshu a
;	lda #9  ; x in bytes , y in pixels
;	ldb #0
	ldd #$0900
	jsr draw_sprite	
	rts
	
draw_hunting_you
	ldy #hunting_you_sprite
	lda #14 ; width in bytes
	pshu a
	lda #6 ; height in pixels
	pshu a
;	lda #8  ; x in bytes , y in pixels
;	ldb #0
	ldd #$0800	
	jsr draw_sprite
	rts
	
;drawline(howmany, len (2 bytes), pattern)
;u = how many
;2,u = len
;3,u = pattern addr
draw_line
	ldb ,u (load number of lines)
@lp
	pshs b ; save outer loop counter
	;inner loop
	ldb 2,u ; load lsb (line len)
	ldx 3,u ; load pattern addr
@il	lda ,x+
	sta ,y+
	decb
	bne @il
	leay SCREEN_WIDTH_BYTES,y 	;drop down a line
	tfr y,d
	subd 1,u ; subtract line length (16 bits)
	tfr d,y  
	puls b ; restore loop counter
	decb
	bne @lp
	leau 5,u ; pop params
	rts
	
draw_escaped
	lda #WHITE_FILL
	jsr cls
;	ldd #$0B06
	lda #11
	pshu a
	lda #6
	pshu a
;	lda #11
;	ldb #96
	ldd #$0A60 ; coordinate
	ldy #you_escaped_sprite
	jsr draw_sprite
	rts
	
;waste time
waste_time
	ldx #0
@o	ldy #0
@l	leay 1,y
	cmpy #65535
	bne @l
	leax 1,x
	cmpx #4
	bne @o
	rts
	
flip_buffer
	;disable interrupts
	PSHS CC     ;save CC
    ORCC #$50   ;mask interrupts
	
	LDA  $FF03 
    PSHS A      ;save PIA configuration 

    LDA  $FF03
    ORA  #$04   ;ensure PIA 0B is NOT setting direction
    STA  $FF03

    LDA  $FF03 
    ANDA #$FD   ;vsync flag - trigger on falling edge
    STA  $FF03

    LDA  $FF03
    ORA  #$01   ;enable vsync IRQ (although interrupt itself will be ignored via mask)
    STA  $FF03

    LDA  $FF02  ;clear any pending VSYNC
@l1 LDA  $FF03  ;wait for flag to indicate...
    BPL  @l1     ;...falling edge of FS (Field Sync)
    LDA  $FF02  ;clear VSYNC interrupt flag

	
	;point sam to new page
	lda bufferNum
	beq @t
	;tell SAM to display page 19 2600h / 6144d (page 19 = 10011)
	sta SAM_PG_F0_SET 
	sta SAM_PG_F1_SET
	sta SAM_PG_F2_CLR
	sta SAM_PG_F3_CLR
	sta SAM_PG_F4_SET
	sta SAM_PG_F5_CLR
	sta SAM_PG_F6_CLR	
	;flip the buffer num
	clr bufferNum
	;draw to page 7
	ldy #VRAM1
	sty vramAddr
	bra @d
@t	;tell SAM to display page 7. (0000111) 
	sta SAM_PG_F0_SET
	sta SAM_PG_F1_SET
	sta SAM_PG_F2_SET
	sta SAM_PG_F3_CLR
	sta SAM_PG_F4_CLR
	sta SAM_PG_F5_CLR
	sta SAM_PG_F6_CLR
	;flip the buffer num
	lda #1
	sta bufferNum
	;draw to page 13
	ldy #VRAM2
	sty vramAddr
@d	
	PULS A      ;from stack... 
    STA  $FF03  ;...restore original PIA configuration
    PULS CC     ;restore ability to see interrupts

	rts

static1 
	.db 00000000b,00001100b,00000000b,00000011b,00110000b,00001100b
static2 
	.db 00000011b,00110000b,00110000b,11001100b,00001100b,00110000b
static3 
	.db 00000000b,00000000b,00001100b,00000000b,00110000b,11000000b
static4 
	.db 00110000b,00000011b,00000000b,00110000b,00000011b,00110000b
static5 
	.db 00000000b,00110000b,11000000b,00000000b,11000000b,11000000b
static6
	.db 00000000b,00000000b,00000000b,00000000b,000000000b,00000000b
static7 
	.db 00000000b,00000011b,00110000b,00000000b,11000000b,11000000b
static8
	.db 00000000b,00000000b,00000000b,00000000b,0000000000b,00000000b
end_static
	.db 0

