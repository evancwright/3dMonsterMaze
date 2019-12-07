set_monster_message
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
	bne @c2
	lda player_y
	cmpa monster_y 
	bcc @c2 ; if (player_y > monster_y)
	lda #BEHIND
	sta monster_orientation
	bra @x
@c2 lda direction
	cmpa #DOWN
	bne @c3
	lda monster_x
	cmpa player_x
	bne @c3
	lda player_y
	cmpa monster_y
	bcs @c3  ; if (player_y < monster_y)
	lda #BEHIND
	sta monster_orientation
	bra @x
@c3 lda direction
	cmpa #LEFT ; west
	bne @c4
	lda monster_y
	cmpa player_y
	bne @c4
	lda player_x
	cmpa monster_x
	bcc @c4  ; if (player_x < monster_x)
	lda #BEHIND
	sta monster_orientation
	bra @x
@c4 lda direction
	cmpa #RIGHT
	bne @x
	lda monster_y
	cmpa player_y
	bne @x
	lda player_x
	cmpa monster_x
	bcc @x  ; if (player_x < monster_x)
	lda #BEHIND
	sta monster_orientation
@x	rts

;sets orientation if monster to side of player
;line of sight is not checked
set_left_right
	lda direction
	ldb player_x
	cmpa #UP
	beq @c2
	cmpa #DOWN
	beq @c2
	cmpb monster_x
	bne @c2
	;x's are same, but player is looking left or right
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

 