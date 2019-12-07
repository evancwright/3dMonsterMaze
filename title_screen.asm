;title_screen


do_lose_screen
	lda #WHITE_FILL
	jsr cls
	lda #3
	ldb #4
	jsr set_draw_offset
	ldx #sprite_wumpus_left
	jsr draw_tile
	lda #4
	ldb #4
	jsr set_draw_offset
	ldx #sprite_wumpus_right
	jsr draw_tile
	;replace with something that seeds rand
	@lp2
	jsr [POLCAT]
	cmpa #0
	beq @lp2
	jsr reset_game
	rts
	
	
	
