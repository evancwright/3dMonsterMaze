;line of sight.asm
;subroutines for checking if monster
;can see player
;,u=the offset to move each check
check_see_player
	ldb #0 ; 
	;check if y coords are same
	lda player_y 
	cmpa monster_y
	bne @x
	;look right until wall hit
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
	pshs x
	ldx #1
	pshu x
	jsr check_see_player
	puls x
	rts

	
;result in b
check_see_player_left
	pshs x
	ldx #-1
	pshu x
	jsr check_see_player
	puls x
	rts	

;result in b
check_see_player_up
	pshs x
	ldx #-MAZE_WIDTH
	pshu x
	jsr check_see_player
	puls x
	rts	

;result in b
check_see_player_down
	pshs x
	ldx #MAZE_WIDTH
	pshu x
	jsr check_see_player
	puls x
	rts			
