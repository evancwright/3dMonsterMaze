;3d monster maze
;(c) Evan Wright, 2019-2020


;ROM ROUTINES
;KBSCAN 	EQU $A1CB
POLCAT EQU $A000

;SAM VIDEO PAGE PAGE
SAM_V0_CLR EQU $FFC0
SAM_V0_SET EQU $FFC1
SAM_V1_CLR EQU $FFC2
SAM_V1_SET EQU $FFC3
SAM_V2_CLR EQU $FFC4
SAM_V2_SET EQU $FFC5

;SAM PAGE SELECT
SAM_PG_F0_CLR EQU $FFC6
SAM_PG_F0_SET EQU $FFC7
SAM_PG_F1_CLR EQU $FFC8
SAM_PG_F1_SET EQU $FFC9
SAM_PG_F2_CLR EQU $FFCA
SAM_PG_F2_SET EQU $FFCB
SAM_PG_F3_CLR EQU $FFCC
SAM_PG_F3_SET EQU $FFCD
SAM_PG_F4_CLR EQU $FFCE
SAM_PG_F4_SET EQU $FFCF
SAM_PG_F5_CLR EQU $FFD0
SAM_PG_F5_SET EQU $FFD1
SAM_PG_F6_CLR EQU $FFD2
SAM_PG_F6_SET EQU $FFD3

VDG_CONTROL EQU $FF22
	
GM_0 EQU  16
GM_1 EQU  32
GM_2 EQU  64
COLOR_BIT EQU 8
WIDTH EQU 16
TILE_BYTE_WIDTH EQU 4
TILE_HEIGHT EQU 24
ROW_SKIP EQU ((TILE_HEIGHT*32)-32) ; 480
NUM_TILES EQU 64 ; 12 x 8 = 

DRAW_X EQU 0
DRAW_Y EQU 1

DOWN EQU 0
LEFT EQU 1
UP EQU 2
RIGHT EQU 3


ESC EQU 03h

EASY EQU 0
MEDIUM EQU 1
HARD EQU 2

BLACK EQU 0
BLUE EQU 1
ORANGE EQU 2
ORANGE_FILL EQU $AA
BLACK_FILL EQU $00
BLUE_FILL EQU $55
WHITE_FILL EQU $FF
WHITE EQU 3


	include vardefs.asm

;key codes
KEY_UP EQU $5E
KEY_DOWN EQU $0A
KEY_LEFT EQU $08
KEY_RIGHT EQU $09
 
;VRAM EQU $E00
VRAM1 EQU $E00  ; 1st graphics buffer (page 2)
VRAM2 EQU $2600 ; 2nd graphics buffer (page 14)

; code will start at 3400

	;ORG 0x3E00  BIN FILE ORG
	ORG 0xC000
START



main
	jsr init_vars
	lda #BLACK_FILL
	jsr cls
	ldy #main
	sty static_start
 	;save stacks in case of warm restart
	ldu #$5FFF  ; cart stack needs to be moved lower in memory
	sts sstack_save
	stu ustack_save
reset	
	nop ; BASIC LOOKS FOR A NOP ON WARM RESTART!!!!!
	;restore stacks (in case of warm restart)
	lds sstack_save
	ldu ustack_save
	
	jsr setup_sam
	include calibration.asm ; include INLINE
;	jsr init_sprites
	jsr draw_title   ; waits a for a keypress to continue
 	jsr skill_level_screen
	jsr reset_game
	jsr draw_tiles
@lp  ;main loop
	jsr [POLCAT]
	ldy ticks ; monster update ticks
	leay 1,y
	sty ticks
	cmpy monsterTicks
	bne @c
	jsr update_monster
	jsr set_tiles
	jsr draw_tiles ; redraw in case monster now visible
	bra @lp
@c	cmpa #0
	beq @lp
	cmpa #'M'
	bne @k
	lda showMap
	eora #1  ; flip it
	sta showMap
	jsr set_tiles
	jsr draw_tiles ; redraw in case monster now visible
	bra @lp
@k	cmpa #'Y'
	bne @a
	lda cheat  ; toggle cheat code
	eora #1
	sta cheat
	bra @lp
@a	cmpa #'A'
	beq @l
	cmpa #KEY_LEFT
	beq @l
;	cmpa #'S'
;	beq @m	
	cmpa #'W'
	beq @m
	cmpa #KEY_UP
	beq @m	
	cmpa #'D'
	beq @r
	cmpa #KEY_RIGHT
	beq @r		
;	cmpa #'P'
;	bne @lp
;	lda paused
;	eora #1  ; toggle it
;	sta paused
;	bra @lp
;	bne @p
; 	cmpa #ESC  ; ESC
;	beq @quit 
	bra @lp	   ; key wasn't handled
@l	jsr turn_left
	bra @lp
@r	jsr turn_right
	bra @lp
;@h  ;help
	;jsr draw_walls
@s  bra @lp
@m	jsr move_fwd
	bra @lp
	bra @x
@er	;error beep?
@x	lbra @lp
@quit
	lds sstack_save
	ldu ustack_save
	lda #0
	sta $2dd  ; zero out keyboard buf (prevents SYNTAX ERR)
	rts	
	
;clears screen with color in A	
cls
	ldy vramAddr
	tfr y,x 
	leax 6144,x  ;end addr
	pshs x
@lp	sta	,y
	leay 1,y
	cmpy ,s 
	bne @lp
	leas 2,s ;pop local
	rts
	
;pmode 1
setup_sam
	;
	ldy #VRAM1
	sty vramAddr
	; artifact mode   $E00(3072)	
	lda #1 
	;set SAM mode
	sta SAM_V0_CLR
	sta SAM_V1_SET
	sta SAM_V2_SET 
	;set page page (7)
	sta SAM_PG_F0_SET
	sta SAM_PG_F1_SET
	sta SAM_PG_F2_SET
	sta SAM_PG_F3_CLR
	sta SAM_PG_F4_CLR
	sta SAM_PG_F5_CLR
	sta SAM_PG_F6_CLR
	lda #$FC
	sta VDG_CONTROL 
	rts

draw_title
	lda #BLUE_FILL
	jsr cls
	lda #WHITE_FILL
	pshu a
	lda #172 ; height
	pshu a
	lda #30 ; width
	pshu a
	lda #8 ;y 
	pshu a
	lda #1  ; x
	pshu a
	jsr fill_rect
	lda #2
	ldb #13
	ldy #letter_3_sprite
	jsr draw_letter
	lda #4
	ldb #13
	ldy #letter_d_sprite
	jsr draw_letter
	lda #7
	ldb #13
	ldy #letter_m_sprite
	jsr draw_letter
	lda #9
	ldy #letter_o_sprite
	jsr draw_letter
	lda #11
	ldy #letter_n_sprite
	jsr draw_letter
	lda #13
	ldy #letter_s_sprite
	jsr draw_letter	
	lda #15
	ldy #letter_t_sprite
	jsr draw_letter	
	lda #17
	ldy #letter_e_sprite
	jsr draw_letter	
	lda #19
	ldy #letter_r_sprite
	jsr draw_letter	
	lda #22
	ldy #letter_m_sprite
	jsr draw_letter	
	lda #24
	ldy #letter_a_sprite
	jsr draw_letter	
	lda #26
	ldy #letter_z_sprite
	jsr draw_letter	
	lda #28
	ldy #letter_e_sprite
	jsr draw_letter	
	;monster
	jsr draw_monster2
	;draw 'Evan Wright'
	lda #11
	pshu a
	lda #6
	pshu a
	lda #11
	ldb #32
	ldy #evan_sprite
	jsr draw_sprite
	; draw press any key
	lda #12
	pshu a
	lda #6
	pshu a
	lda #10
	ldb #148
	ldy #press_a_key
	jsr draw_sprite
	jsr flip_buffer
	jsr any_key
	lda #WHITE_FILL
	jsr cls
	rts

 
blue_border
	lda #BLUE_FILL
	jsr cls
	lda #WHITE_FILL
	;white rect
	pshu a
	lda #172 ; height
	pshu a
	lda #28 ; width
	pshu a
	lda #8 ;y 
	pshu a
	lda #2  ; x
	pshu a
	jsr fill_rect
	rts
	
;reseeds random seed	
any_key
	leas -1,s  ; push local
	clra	
@lp
	inc ,s
	jsr [POLCAT]
	cmpa #0
	beq @lp
	ldb cur_rand+1 ; left lsb to msb
	stb cur_rand
	lda ,s			; new lsb 
	cmpa #0	
	bne @s
	lda #1   ; don't let a seed be 0!
@s	sta cur_rand+1
	leas 1,s  ; pop local
	rts

	
  	include game_code.asm
	include line_of_sight.asm
 	include orientation.asm
	include math.asm
	include random.asm
	include drawing.asm
 	include maze.asm
	include draw_front.asm
	include sprites.asm
	include calibration_sprites.asm
	include tile_maps.asm
	include calibration.asm
	include wall_sprites.asm
	include hall_sprites.asm
	include letters.asm
	
 
	END START
