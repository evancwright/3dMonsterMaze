
set_monster_orientation
	clr monster_orientation
	jsr set_left_right
	lda monster_orientation
	bne @x
	jsr set_behind
@x	rts

;sets orientation if monster is behind
;line of sight is not checked
set_behind
	;case 1 
	lda direction
	cmpa #UP
	bne @c2
	lda monster_x
	cmpa player_x
	bne @x ; x's not same
	lda player_y
	cmpa monster_y 
	bhi @x ; if (player_y > monster_y)
	bra @y
@c2 cmpa #DOWN
	bne @c3
	lda monster_x
	cmpa player_x
	bne @x  ; x's not same
	lda player_y
	cmpa monster_y
	blo @x  ; if (player_y < monster_y)
	bra @y
@c3 cmpa #LEFT ; west
	bne @c4
	lda monster_y
	cmpa player_y
	bne @x
	lda player_x
	cmpa monster_x
	bhi @c4 
	bra @y  ; player x < monster x
@c4 cmpa #RIGHT
	bne @x
	lda monster_y
	cmpa player_y
	bne @x
	lda player_x
	cmpa monster_x
	blo @x   
	; (player_x < monster_x)
@y  lda #BEHIND  ; player y <= monster_y
	sta monster_orientation
@x	rts

;sets orientation if monster to side of player
;line of sight is not checked
set_left_right
	lda direction
	cmpa #UP
	beq @c2
	cmpa #DOWN
	beq @c2
	;looking left-right, are y's the same?
	ldb player_x
	cmpb monster_x
	bne @x
	lda #TO_SIDE
	sta monster_orientation
	bra @x
@c2	; player is looking up or down
	ldb player_y
	cmpb monster_y
	bne @x
	lda #TO_SIDE
	sta monster_orientation
@x	rts

 