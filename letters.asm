;letters + drawing code

;letters are all 8x 13
;a,b = x(units of 4 pixels),y(pixels)
;y = letter_data
draw_letter
	pshs d,x,y
	tfr d,x
	lda #2
	pshu a
	lda #13
	pshu a
	tfr x,d
	jsr draw_sprite
	puls d,x,y
	rts


;w=8h=13
letter_m_sprite
	.db 223,223
	.db 211,211
	.db 215,83
	.db 212,83
	.db 209,19
	.db 209,19
	.db 211,19
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 243,243
	
;w=8h=13
letter_o_sprite
	.db 255,255
	.db 245,127
	.db 213,95
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 213,83
	.db 245,67
	.db 240,15


	
;w=8h=13
letter_n_sprite
	.db 255,255
	.db 223,223
	.db 215,211
	.db 209,211
	.db 209,211
	.db 208,83
	.db 211,83
	.db 211,19
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 243,243	

;w=8h=13
letter_s_sprite
	.db 255,255
	.db 213,95
	.db 213,83
	.db 208,3
	.db 211,255
	.db 213,95
	.db 213,83
	.db 240,19
	.db 255,211
	.db 255,211
	.db 213,83
	.db 213,83
	.db 240,3

;w=8h=13
letter_t_sprite
	.db 255,255
	.db 213,95
	.db 213,83
	.db 241,3
	.db 253,63
	.db 253,63
	.db 253,63
	.db 253,63
	.db 253,63
	.db 253,63
	.db 253,63
	.db 253,63
	.db 255,63

;w=8h=13
letter_e_sprite
	.db 255,255
	.db 213,95
	.db 213,83
	.db 208,3
	.db 211,255
	.db 213,127
	.db 213,79
	.db 208,15
	.db 211,255
	.db 211,255
	.db 213,95
	.db 213,83
	.db 240,3
	
letter_r_sprite
	.db 255,255
	.db 213,127
	.db 213,95
	.db 208,19
	.db 211,211
	.db 213,83
	.db 213,67
	.db 213,127
	.db 208,95
	.db 211,83
	.db 211,83
	.db 211,83
	.db 243,195

letter_a_sprite	
	.db 255,255
	.db 245,255
	.db 208,127
	.db 211,79
	.db 211,79
	.db 213,79
	.db 213,79
	.db 208,79
	.db 211,79
	.db 211,79
	.db 211,79
	.db 211,79
	.db 243,207
	
;w=8h=13
letter_z_sprite
	.db 255,255
	.db 213,87
	.db 213,84
	.db 240,4
	.db 255,212
	.db 255,84
	.db 253,64
	.db 245,15
	.db 212,63
	.db 208,255
	.db 213,87
	.db 213,84
	.db 240,0

;w=8h=13
letter_3_sprite
	.db 255,255
	.db 213,95
	.db 213,83
	.db 240,19
	.db 255,211
	.db 245,83
	.db 245,83
	.db 252,19
	.db 255,211
	.db 255,211
	.db 213,83
	.db 213,83
	.db 240,3

;w=8h=13
letter_d_sprite
	.db 255,255
	.db 213,127
	.db 213,95
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 211,211
	.db 213,83
	.db 213,67
	.db 240,15	
	