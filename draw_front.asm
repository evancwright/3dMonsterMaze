;routines for drawing front walls

draw_front1
	ldy #WALL_2_LEFT_X
	sty leftEdgeX
	ldy #WALL_2_RIGHT_X
	sty rightEdgeX
	lda #30
	sta frontWidth
	lda #2
	sta frontVSkipL 
	lda #12
	sta howManyTopWhite
	lda #80
	sta howManyCheckered
	lda #4
	sta howManyBottomWhite
	lda #160
	sta frontWallHeight
	ldy #385
	sty leftEdgeOffset
	ldy #414
	sty rightEdgeOffset
	jsr draw_front
	rts

draw_front2
	ldy #WALL_3_LEFT_X
	sty leftEdgeX
	ldy #WALL_3_RIGHT_X
	sty rightEdgeX
	lda #18
	sta frontWidth
	lda #14
	sta frontVSkipL 
	lda #29+TOP
	sta howManyTopWhite
	lda #55
	sta howManyCheckered
	lda #25
	sta howManyBottomWhite
	lda #112
	sta frontWallHeight
	ldy #1159+32
	sty leftEdgeOffset
	ldy #1176+32
	sty rightEdgeOffset
	jsr draw_front
	rts	

draw_front3
	ldy #WALL_4_LEFT_X
	sty leftEdgeX
	ldy #WALL_4_RIGHT_X
	sty rightEdgeX
	lda #12
	sta frontWidth
	lda #20 
	sta frontVSkipL 
	lda #48 
	sta howManyTopWhite
	lda #44
	sta howManyCheckered
	lda #39 
	sta howManyBottomWhite
	lda #88 
	sta frontWallHeight
	ldy #1546
	sty leftEdgeOffset
	ldy #1557 
	sty rightEdgeOffset
	jsr draw_front
	rts

draw_front4
	ldy #WALL_5_LEFT_X
	sty leftEdgeX
	ldy #WALL_5_RIGHT_X
	sty rightEdgeX
	lda #8
	sta frontWidth
	lda #24 
	sta frontVSkipL 
	lda #48+TOP
	sta howManyTopWhite
	lda #36
	sta howManyCheckered
	lda #47 
	sta howManyBottomWhite
	lda #72 
	sta frontWallHeight
	;ldy #1836  ; 12? 
	ldy #1804
	sty leftEdgeOffset
	ldy #1811
	sty rightEdgeOffset
	jsr draw_front
	rts

draw_front5
	ldy #WALL_6_LEFT_X
	sty leftEdgeX
	ldy #WALL_6_RIGHT_X
	sty rightEdgeX
	lda #4
	sta frontWidth
	lda #28 
	sta frontVSkipL 
	lda #56+TOP
	sta howManyTopWhite
	lda #28
	sta howManyCheckered
	lda #55 
	sta howManyBottomWhite
	lda #57 
	sta frontWallHeight
	ldy #2062 
	sty leftEdgeOffset
	ldy #2065
	sty rightEdgeOffset
	jsr draw_front
	rts
	
draw_front
	;each line is 30
	ldy vramAddr
	tfr y,d
	addd  leftEdgeX
	tfr d,y 
	;  alternating 51 and 204 line
	;white lines
	lda frontVSkipL ;   #20 ; skip
    pshu a
	lda howManyTopWhite ; #40+TOP ; how many
	pshu a
	lda frontWidth ; #12 ; len
	pshu a
	jsr draw_white_lines ; 4 lines of white
	;checkered lines
	lda frontVSkipL ; #20 ; skip amount
	pshu a
	lda howManyCheckered ; #44 ; how many pairs
	pshu a
	lda frontWidth ; #12 ; len
	pshu a	
	jsr draw_checkered_lines
 	;line of black
	;ldb #0
 	;lda #0
	ldd #0 ; clear a,b
@l4	stb ,y+  ; 1st line
	inca
	cmpa frontWidth ; #12
	bne @l4
	
	tfr y,x
	ldb frontVSkipL
	abx
	tfr x,y
	;leay 20,y  ; add vksip
	
	;4 lines of white (255)
	lda frontVSkipL  ; #20 ; skip amount
	pshu a
	lda howManyBottomWhite ; how many
	pshu a
	lda frontWidth ; #12 ; len
	pshu a
	jsr draw_white_lines
	;now draw left and right black lines
	ldy leftEdgeOffset ; #1546 ;  
	lda frontWallHeight ; #88
	jsr draw_left_edge
	;now draw right black line
	ldy rightEdgeOffset ; #1558 ;  
	lda frontWallHeight ; #88
	jsr draw_right_edge
	;draw top black line
	ldd leftEdgeOffset ; #1546
	addd vramAddr ;
	tfr d,y
	ldd #0
@l	sta ,y+
	incb
	cmpb frontWidth ; #12
	bne @l
	rts