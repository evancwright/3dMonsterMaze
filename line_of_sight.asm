;line of sight.asm
;subroutines for checking if monster
;can see player
;,u=the offset to move each check
check_see_player
	ldb #0 ; 
	;look  until wall hit
	ldy monster_location
@lp exg d,y  ; -> y to d
	addd ,u
	exg d,y  ; -> d to y
	lda ,y
    cmpa #WALL
    beq @x	
	cmpy player_location
	beq @y
	bra @lp
@y	lda #1
	sta player_seen
	lda #CHASING
	sta monster_state
 	lda #RIGHT
	sta monster_direction
	jsr move_monster
	ldb #1
@x	leau 2,u ; pop param
	rts


;result in 'b'
check_see_player_right
	;check if y coords are same
	clrb
	lda player_y 
	cmpa monster_y
	bne @x
	pshs x
	ldx #1
	pshu x
	jsr check_see_player
	puls x
@x	rts

	
;result in b
check_see_player_left
	;check if y coords are same
	clrb
	lda player_y 
	cmpa monster_y
	bne @x
	pshs x
	ldx #-1
	pshu x
	jsr check_see_player
	puls x
@x	rts	

;result in b
check_see_player_up
	;check if y coords are same
	clrb
	lda player_x 
	cmpa monster_x
	bne @x
	pshs x
	ldx #-MAZE_WIDTH
	pshu x
	jsr check_see_player
	puls x
@x	rts	

;result in b
check_see_player_down
	;check if y coords are same
	clrb
	lda player_x 
	cmpa monster_x
	bne @x
	pshs x
	ldx #MAZE_WIDTH
	pshu x
	jsr check_see_player
	puls x
@x	rts			
