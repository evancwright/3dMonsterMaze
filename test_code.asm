draw_walls
	lda #1
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #0
	ldb #0
	ldy #wall_left_1
	jsr draw_sprite
	;left wall 2
	lda #WALL_2_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_2_LEFT_X
	ldb #0
	ldy #wall_left_2
	jsr draw_sprite
	;left wall 3
	lda #WALL_3_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_3_LEFT_X
	ldb #0
	ldy #wall_left_3
	jsr draw_sprite	
	;left wall 4
	lda #WALL_4_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_4_LEFT_X
	ldb #0
	ldy #wall_left_4
	jsr draw_sprite		
	;wall 5
	lda #WALL_5_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_5_LEFT_X
	ldb #0
	ldy #wall_left_5
	jsr draw_sprite		
	;RIGHT WALLS
	lda #WALL_1_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_1_RIGHT_X
	ldb #0
	ldy #wall_right_1
	jsr draw_sprite		
	;right wall 2
	lda #WALL_2_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_2_RIGHT_X
	ldb #0
	ldy #wall_right_2
	jsr draw_sprite			
	;right wall 3
	lda #WALL_3_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_3_RIGHT_X
	ldb #0
	ldy #wall_right_3
	jsr draw_sprite		
	;right wall 4
	lda #WALL_4_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_4_RIGHT_X
	ldb #0
	ldy #wall_right_4
	jsr draw_sprite			
	;right wall 5
	lda #WALL_5_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_5_RIGHT_X
	ldb #0
	ldy #wall_right_5
	jsr draw_sprite			
	rts
	
draw_halls
	lda #1
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #0
	ldb #0
	ldy #hall_left_1
	jsr draw_sprite
	;left wall 2
	lda #WALL_2_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_2_LEFT_X
	ldb #0
	ldy #hall_left_2
	jsr draw_sprite
	;left wall 3
	lda #WALL_3_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_3_LEFT_X
	ldb #0
	ldy #hall_left_3
	jsr draw_sprite	
	;left wall 4
	lda #WALL_4_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_4_LEFT_X
	ldb #0
	ldy #hall_left_4
	jsr draw_sprite		
	;wall 5
	lda #WALL_5_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_5_LEFT_X
	ldb #0
	ldy #hall_left_5
	jsr draw_sprite		
	;RIGHT WALLS
	lda #WALL_1_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_1_RIGHT_X
	ldb #0
	ldy #hall_right_1
	jsr draw_sprite		
	;right wall 2
	lda #WALL_2_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_2_RIGHT_X
	ldb #0
	ldy #hall_right_2
	jsr draw_sprite			
	;right wall 3
	lda #WALL_3_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_3_RIGHT_X
	ldb #0
	ldy #hall_right_3
	jsr draw_sprite		
	;right wall 4
	lda #WALL_4_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_4_RIGHT_X
	ldb #0
	ldy #hall_right_4
	jsr draw_sprite			
	;right wall 5
	lda #WALL_5_WIDTH
	pshu a
	lda #WALL_HEIGHT
	pshu a
	lda #WALL_5_RIGHT_X
	ldb #0
	ldy #hall_right_5
	jsr draw_sprite			
	rts	
