;put your sprites here

evan_sprite ;11 x 6
	.db 195,51,3,60,243,243,3,48,12,204,15
	.db 207,51,51,12,243,243,51,51,252,207,63
	.db 195,51,3,0,243,243,3,51,252,207,63
	.db 207,51,51,48,243,51,15,51,12,15,63
	.db 207,3,51,60,240,195,51,51,204,207,63
	.db 195,207,51,60,243,243,51,48,12,207,63


	
;14 x 6	
hunting_you_sprite
	.db 51,15,48,243,51,51,204,12,207,48,60,204,12,207
	.db 51,63,51,243,51,48,207,60,195,51,252,204,204,207
	.db 3,15,48,240,51,48,207,60,195,51,252,204,204,207
	.db 51,63,60,243,51,51,15,60,204,51,63,60,204,207
	.db 51,63,60,243,51,51,15,60,204,51,63,60,204,207
	.db 51,15,48,243,48,51,207,60,207,48,63,60,12,15
;13x6
lies_in_wait_sprite
	.db 3,12,252,243,204,48,243,60,243,243,207,48,63
	.db 51,63,51,243,204,243,243,12,243,243,51,60,255
	.db 15,15,207,243,204,48,243,0,243,243,51,60,255
	.db 51,63,207,243,204,252,243,48,243,51,3,60,255
	.db 51,63,51,243,204,252,243,60,240,195,51,60,255
	.db 51,12,252,240,204,48,243,60,243,243,51,60,255
	
monster4_mask
	.db 255,255,255,255
	.db 255,192,0,255
	.db 252,0,0,63
	.db 252,0,0,63
	.db 252,0,0,15
	.db 252,0,0,15
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,63
	.db 240,0,0,63
	.db 240,0,0,63
	.db 252,0,0,63
	.db 252,0,0,63
	.db 252,0,0,63
	.db 240,0,0,3
	.db 192,0,0,3
	.db 192,0,0,0
	.db 192,0,0,0
	.db 192,0,0,48
	.db 204,0,0,48
	.db 204,0,0,60
	.db 12,0,0,60
	.db 12,0,0,60
	.db 12,0,0,12
	.db 60,0,0,12
	.db 60,0,0,15
	.db 60,0,0,15
	.db 60,0,0,15
	.db 252,0,0,3
	.db 252,0,0,3
	.db 240,0,0,3
	.db 240,0,0,3
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,0
	.db 192,0,0,0
	.db 192,60,0,3
	.db 192,60,0,15
	.db 192,63,0,15
	.db 192,255,252,3
	.db 192,255,252,3
	.db 0,255,252,3
	.db 0,255,255,3
	.db 0,255,255,3
	.db 3,255,255,3
	.db 51,255,255,3
	.db 255,255,255,0
	.db 255,255,255,192
	.db 255,255,255,240
	.db 255,255,255,255
	
monster4_data
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,60,15,0
	.db 0,12,12,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 2,0,0,0
	.db 0,140,192,0
	.db 0,128,2,0
	.db 0,168,42,0
	.db 0,42,168,0
	.db 0,42,168,0
	.db 0,42,168,0
	.db 0,10,160,0
	.db 0,10,160,0
	.db 0,2,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0

	

monster3_data
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,240,60,0
	.db 0,48,48,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,128
	.db 8,0,0,128
	.db 10,0,2,0
	.db 10,12,194,0
	.db 10,0,10,0
	.db 2,128,10,0
	.db 2,160,40,0
	.db 2,170,168,0
	.db 2,170,168,0
	.db 0,170,168,0
	.db 0,170,160,0
	.db 0,170,160,0
	.db 0,42,160,0
	.db 0,42,128,0
	.db 0,10,128,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0

monster3_mask
	.db 255,0,0,255
	.db 255,0,0,255
	.db 252,0,0,63
	.db 252,0,0,15
	.db 240,0,0,15
	.db 240,0,0,15
	.db 192,0,0,3
	.db 192,0,0,3
	.db 192,0,0,3
	.db 192,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,15
	.db 192,0,0,15
	.db 192,0,0,15
	.db 192,0,0,15
	.db 192,0,0,15
	.db 192,0,0,15
	.db 192,0,0,15
	.db 240,0,0,63
	.db 240,0,0,63
	.db 240,0,0,63
	.db 192,0,0,63
	.db 192,0,0,15
	.db 0,0,0,15
	.db 0,0,0,15
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 12,0,0,3
	.db 12,0,0,3
	.db 12,0,0,0
	.db 12,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 192,0,0,0
	.db 192,0,0,3
	.db 192,0,0,3
	.db 192,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 192,0,0,3
	.db 192,0,0,3
	.db 192,0,0,3
	.db 192,48,0,0
	.db 192,60,0,0
	.db 192,60,0,3
	.db 192,252,0,0
	.db 192,255,252,0
	.db 192,255,255,0
	.db 192,255,255,0
	.db 192,255,255,0
	.db 192,255,255,192
	.db 192,255,255,192
	.db 192,255,255,255
	.db 0,255,255,255
	.db 15,255,255,255
	

;monster2_mask (old)
;	.db 255,255,255,0,3,255,255
;	.db 255,255,252,0,0,255,255
;	.db 255,255,240,0,0,63,255
;	.db 255,255,0,0,0,15,255
;	.db 255,252,0,0,0,3,255
;	.db 255,240,0,0,0,3,255
;	.db 255,240,0,0,0,3,255
;	.db 255,240,0,0,0,0,255
;	.db 255,192,0,0,0,0,255
;	.db 255,192,0,0,0,0,255
;	.db 255,192,0,0,0,0,255
;	.db 255,0,0,0,0,0,255
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 255,0,0,0,0,0,15
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 255,0,0,0,0,0,63
;	.db 252,0,0,0,0,0,63
;	.db 252,0,0,0,0,0,63
;	.db 252,0,0,0,0,0,63
;	.db 240,0,0,0,0,0,15
;	.db 240,0,0,0,0,0,15
;	.db 192,0,0,0,0,0,15
;	.db 192,0,0,0,0,0,15
;	.db 192,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,0
;	.db 15,0,0,0,0,0,0
;	.db 60,0,0,0,0,0,0
;	.db 60,0,0,0,0,0,192
;	.db 48,0,0,0,0,0,192
;	.db 48,0,0,0,0,0,48
;	.db 48,0,0,0,0,0,48
;	.db 48,0,0,0,0,0,48
;	.db 240,0,0,0,0,0,48
;	.db 240,0,0,0,0,0,48
;	.db 240,0,0,0,0,0,63
;	.db 192,0,0,0,0,0,63
;	.db 192,0,0,0,0,0,15
;	.db 192,0,0,0,0,0,15
;	.db 192,0,0,0,0,0,3
;	.db 192,0,0,0,0,0,3
;	.db 192,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,3
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,15
;	.db 0,0,0,0,0,0,3
;	.db 0,0,192,0,12,0,3
;	.db 0,3,192,0,3,0,3
;	.db 0,15,192,0,3,0,3
;	.db 0,63,192,0,0,0,3
;	.db 0,63,240,0,0,0,0
;	.db 0,63,240,0,0,0,0
;	.db 0,63,240,0,0,0,0
;	.db 0,63,252,0,0,12,0
;	.db 0,63,255,192,0,60,0
;	.db 0,63,255,240,0,60,0
;	.db 0,63,255,255,255,252,0
;	.db 0,63,255,255,255,252,0
;	.db 0,63,255,255,255,255,3
;	.db 0,63,255,255,255,255,255
;	.db 0,63,255,255,255,255,255
;	.db 0,63,255,255,255,255,255
;	.db 0,15,255,255,255,255,255
monster2_mask ;(new)
	.db 255,255,255,0,15,255,255
	.db 255,255,252,0,0,255,255
	.db 255,255,240,0,0,255,255
	.db 255,255,240,0,0,255,255
	.db 255,255,240,0,0,63,255
	.db 255,255,192,0,0,15,255
	.db 255,255,192,0,0,15,255
	.db 255,255,192,0,0,15,255
	.db 255,255,0,0,0,15,255
	.db 255,255,0,0,0,3,255
	.db 255,255,0,0,0,3,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,3,255
	.db 255,252,0,0,0,3,255
	.db 255,252,0,0,0,0,255
	.db 255,252,0,0,0,0,255
	.db 255,240,0,0,0,0,255
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,240,0,0,0,0,63
	.db 255,240,0,0,0,0,15
	.db 255,240,0,0,0,0,15
	.db 255,240,0,0,0,0,15
	.db 255,240,0,0,0,0,15
	.db 255,240,0,0,0,0,255
	.db 255,192,0,0,0,0,255
	.db 255,192,0,0,0,0,255
	.db 255,192,0,0,0,0,255
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,63
	.db 255,192,0,0,0,0,15
	.db 255,0,0,0,0,0,15
	.db 255,0,0,0,0,0,15
	.db 255,0,0,0,0,0,15
	.db 255,0,0,0,0,0,15
	.db 255,0,0,0,0,0,15
	.db 255,0,0,0,0,0,15
	.db 255,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,0,0,15
	.db 252,0,0,0,12,0,15
	.db 255,0,0,0,3,0,15
	.db 255,0,0,0,3,0,12
	.db 255,0,0,0,0,0,0
	.db 255,0,48,0,0,0,3
	.db 255,0,48,0,0,0,3
	.db 255,0,48,0,0,0,15
	.db 255,0,60,0,0,0,15
	.db 252,0,63,192,0,0,3
	.db 252,0,63,240,0,0,3
	.db 252,0,63,255,255,192,3
	.db 252,0,255,255,255,192,3
	.db 252,0,255,255,255,195,15
	.db 252,0,255,255,255,255,255
	.db 252,12,255,255,255,255,255
	.db 252,204,255,255,255,255,255
	.db 252,252,255,255,255,255,255
;;filled
monster2_data
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,48,0,3,0,0
	.db 0,0,60,0,15,0,0
	.db 0,0,63,0,63,0,0
	.db 0,0,51,0,51,0,0
	.db 0,0,0,0,3,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,204,0,0,0
	.db 0,0,0,0,0,15,0
	.db 0,3,0,0,0,63,0
	.db 0,3,192,0,0,194,0
	.db 0,2,48,0,3,10,0
	.db 0,2,15,0,60,40,0
	.db 0,0,128,255,192,60,0
	.db 0,0,128,0,0,48,0
	.db 0,0,160,0,0,176,0
	.db 0,0,224,0,2,176,0
	.db 0,0,48,0,2,192,0
	.db 0,0,56,0,10,192,0
	.db 0,0,58,0,15,0,0
	.db 0,0,15,0,44,0,0
	.db 0,0,3,128,44,0,0
	.db 0,0,3,170,176,0,0
	.db 0,0,3,234,176,0,0
	.db 0,0,0,255,192,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,12,0,0
	.db 0,0,0,0,3,0,0
	.db 0,0,0,0,3,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0
;monster2_data ; (new)
;	.db 255,255,255,0,15,255,255
;	.db 255,255,252,0,0,255,255
;	.db 255,255,240,0,0,255,255
;	.db 255,255,240,0,0,255,255
;	.db 255,255,240,0,0,63,255
;	.db 255,255,192,0,0,15,255
;	.db 255,255,192,0,0,15,255
;	.db 255,255,240,0,3,15,255
;	.db 255,255,60,0,15,15,255
;	.db 255,255,63,0,63,3,255
;	.db 255,255,51,0,51,3,255
;	.db 255,252,0,0,3,0,255
;	.db 255,252,0,0,0,0,255
;	.db 255,252,0,0,0,0,255
;	.db 255,252,0,0,0,0,255
;	.db 255,252,0,0,0,0,255
;	.db 255,252,0,0,0,0,255
;	.db 255,252,0,0,0,0,63
;	.db 255,240,0,0,0,0,63
;	.db 255,240,0,0,0,0,63
;	.db 255,240,0,0,0,0,63
;	.db 255,240,0,0,0,0,63
;	.db 255,240,0,204,0,0,63
;	.db 255,240,0,0,0,15,63
;	.db 255,243,0,0,0,63,63
;	.db 255,243,192,0,0,194,63
;	.db 255,242,48,0,3,10,63
;	.db 255,242,15,0,60,40,63
;	.db 255,240,128,255,192,60,255
;	.db 255,252,128,0,0,48,255
;	.db 255,252,160,0,0,176,255
;	.db 255,252,224,0,2,176,255
;	.db 255,252,48,0,2,192,255
;	.db 255,252,56,0,10,195,255
;	.db 255,252,58,0,15,3,255
;	.db 255,252,15,0,44,0,255
;	.db 255,252,3,128,44,0,255
;	.db 255,240,3,170,176,0,255
;	.db 255,192,3,234,176,0,63
;	.db 255,192,0,255,192,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,240,0,0,0,0,63
;	.db 255,240,0,0,0,0,15
;	.db 255,240,0,0,0,0,15
;	.db 255,240,0,0,0,0,15
;	.db 255,240,0,0,0,0,15
;	.db 255,240,0,0,0,0,255
;	.db 255,192,0,0,0,0,255
;	.db 255,192,0,0,0,0,255
;;	.db 255,192,0,0,0,0,255
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,63
;	.db 255,192,0,0,0,0,15
;	.db 255,0,0,0,0,0,15
;	.db 255,0,0,0,0,0,15
;	.db 255,0,0,0,0,0,15
;	.db 255,0,0,0,0,0,15
;	.db 255,0,0,0,0,0,15
;	.db 255,0,0,0,0,0,15
;	.db 255,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,0,0,15
;	.db 252,0,0,0,12,0,15
;	.db 255,0,0,0,3,0,15
;	.db 255,0,0,0,3,0,12
;	.db 255,0,0,0,0,0,0
;	.db 255,0,48,0,0,0,3
;	.db 255,0,48,0,0,0,3
;	.db 255,0,48,0,0,0,15
;	.db 255,0,60,0,0,0,15
;	.db 252,0,63,192,0,0,3
;	.db 252,0,63,240,0,0,3
;	.db 252,0,63,255,255,192,3
;	.db 252,0,255,255,255,192,3
;	.db 252,0,255,255,255,195,15
;	.db 252,0,255,255,255,255,255
;	.db 240,0,255,255,255,255,255
;	.db 240,204,255,255,255,255,255
;	.db 240,252,255,255,255,255,255


;w=16h=24
orange_tooth
	.db 0,15,252,0
	.db 3,255,255,240
	.db 63,255,255,252
	.db 63,255,255,252
	.db 15,255,255,252
	.db 143,255,255,252
	.db 143,255,255,252
	.db 131,255,255,240
	.db 163,255,255,242
	.db 163,255,255,242
	.db 163,255,255,194
	.db 163,255,255,202
	.db 163,255,255,10
	.db 163,255,255,42
	.db 163,255,252,42
	.db 163,255,252,170
	.db 163,255,240,170
	.db 163,255,242,170
	.db 131,255,194,170
	.db 143,255,202,170
	.db 143,255,42,170
	.db 143,240,42,170
	.db 131,10,170,170
	.db 160,42,170,170

orange_tooth_mask
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 192,0,0,0
	.db 192,0,0,0
	.db 192,0,0,0
	.db 240,0,0,3
	.db 240,0,0,3
	.db 240,0,0,3
	.db 240,0,0,15
	.db 240,0,0,15
	.db 240,0,0,63
	.db 240,0,0,63
	.db 240,0,0,255
	.db 240,0,0,255
	.db 240,0,3,255
	.db 192,0,3,255
	.db 192,0,15,255
	.db 192,0,63,255
	.db 192,0,63,255
	.db 192,15,255,255
	.db 240,63,255,255

 

orange_tooth_data
 	.db 0,15,252,0
	.db 3,255,255,240
	.db 63,255,255,252
	.db 63,255,255,252
	.db 15,255,255,252
	.db 15,255,255,252
	.db 15,255,255,252
	.db 3,255,255,240
	.db 3,255,255,240
	.db 3,255,255,240
	.db 3,255,255,192
	.db 3,255,255,192
	.db 3,255,255,0
	.db 3,255,255,0
	.db 3,255,252,0
	.db 3,255,252,0
	.db 3,255,240,0
	.db 3,255,240,0
	.db 3,255,192,0
	.db 15,255,192,0
	.db 15,255,0,0
	.db 15,240,0,0
	.db 3,0,0,0
	.db 0,0,0,0

 
 
 
curved_tooth
;w=16h=24
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 160,0,0,0
	.db 160,0,0,0
	.db 160,0,0,0
	.db 168,192,0,0
	.db 168,240,0,0
	.db 168,240,0,0
	.db 160,252,0,0
	.db 163,255,0,0
	.db 163,255,0,0
	.db 163,255,192,0
	.db 131,255,192,0
	.db 143,255,240,0
	.db 143,255,240,0
	.db 143,255,252,0
	.db 15,255,240,0
	.db 63,255,194,0
	.db 63,255,10,0
	.db 63,252,42,128
	.db 15,192,170,128
	.db 128,10,170,160
	.db 170,170,170,168

curved_tooth_mask
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 240,0,0,0
	.db 240,0,0,0
	.db 240,0,0,0
	.db 252,0,0,0
	.db 252,0,0,0
	.db 252,0,0,0
	.db 240,0,0,0
	.db 240,0,0,0
	.db 240,0,0,0
	.db 240,0,0,0
	.db 192,0,0,0
	.db 192,0,0,0
	.db 192,0,0,0
	.db 192,0,0,0
	.db 0,0,0,0
	.db 0,0,3,0
	.db 0,0,15,0
	.db 0,0,63,192
	.db 0,0,255,192
	.db 192,15,255,240
	.db 255,255,255,252


curved_tooth_data
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,192,0,0
	.db 0,240,0,0
	.db 0,240,0,0
	.db 0,252,0,0
	.db 3,255,0,0
	.db 3,255,0,0
	.db 3,255,192,0
	.db 3,255,192,0
	.db 15,255,240,0
	.db 15,255,240,0
	.db 15,255,252,0
	.db 15,255,240,0
	.db 63,255,192,0
	.db 63,255,0,0
	.db 63,252,0,0
	.db 15,192,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	
	
	
	
orange_tooth_up
	.db 170,170,170,170
	.db 170,160,42,170
	.db 170,163,42,170
	.db 170,163,10,170
	.db 170,163,10,170
	.db 170,3,194,170
	.db 170,63,242,170
	.db 170,63,240,170
	.db 168,63,252,170
	.db 168,63,252,42
	.db 168,63,252,42
	.db 168,63,252,42
	.db 160,255,255,42
	.db 160,255,255,10
	.db 160,255,255,2
	.db 160,255,255,2
	.db 163,255,255,194
	.db 143,255,255,242
	.db 143,255,255,242
	.db 15,255,255,242
	.db 63,255,255,242
	.db 63,255,255,240
	.db 15,255,255,240
	.db 3,255,255,192

curved_tooth_up
	.db 42,170,170,130
	.db 42,170,170,12
	.db 42,170,128,252
	.db 42,170,15,252
	.db 10,160,63,252
	.db 10,0,255,252
	.db 0,63,255,252
	.db 3,255,255,252
	.db 0,255,255,252
	.db 0,255,255,252
	.db 0,63,255,252
	.db 0,63,255,252
	.db 0,63,255,252
	.db 0,63,255,252
	.db 0,15,255,240
	.db 0,15,255,242
	.db 0,3,255,242
	.db 0,3,255,242
	.db 0,0,255,242
	.db 0,0,63,242
	.db 0,0,3,242
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0

orange_tile
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170
	.db 170,170,170,170

black_tile
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	
orange_tooth_up_mask
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,3,0,0
	.db 0,3,0,0
	.db 0,3,0,0
	.db 0,3,192,0
	.db 0,63,240,0
	.db 0,63,240,0
	.db 0,63,252,0
	.db 0,63,252,0
	.db 0,63,252,0
	.db 0,63,252,0
	.db 0,255,255,0
	.db 0,255,255,0
	.db 0,255,255,0
	.db 0,255,255,0
	.db 3,255,255,192
	.db 15,255,255,240
	.db 15,255,255,240
	.db 15,255,255,240
	.db 63,255,255,240
	.db 63,255,255,240
	.db 15,255,255,240
	.db 3,255,255,192

orange_tooth_up_data
	.db 255,255,255,255
	.db 255,240,63,255
	.db 255,240,63,255
	.db 255,240,15,255
	.db 255,240,15,255
	.db 255,0,3,255
	.db 255,0,3,255
	.db 255,0,0,255
	.db 252,0,0,255
	.db 252,0,0,63
	.db 252,0,0,63
	.db 252,0,0,63
	.db 240,0,0,63
	.db 240,0,0,15
	.db 240,0,0,3
	.db 240,0,0,3
	.db 240,0,0,3
	.db 192,0,0,3
	.db 192,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0

curved_tooth_up_mask	
	.db 63,255,255,195
	.db 63,255,255,0
	.db 63,255,192,0
	.db 63,255,0,0
	.db 15,240,0,0
	.db 15,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,3
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0

curved_tooth_up_data
	.db 0,0,0,0
	.db 0,0,0,12
	.db 0,0,0,252
	.db 0,0,15,252
	.db 0,0,63,252
	.db 0,0,255,252
	.db 0,63,255,252
	.db 3,255,255,252
	.db 0,255,255,252
	.db 0,255,255,252
	.db 0,63,255,252
	.db 0,63,255,252
	.db 0,63,255,252
	.db 0,63,255,252
	.db 0,15,255,240
	.db 0,15,255,240
	.db 0,3,255,240
	.db 0,3,255,240
	.db 0,0,255,240
	.db 0,0,63,240
	.db 0,0,3,240
	.db 0,0,0,0
	.db 0,0,0,0
	.db 0,0,0,0

;w=8h=8
compass_north ; letter n 
	.db 243,207
	.db 240,207
	.db 240,207
	.db 243,15
	.db 243,15
	.db 243,207
	.db 243,207
	.db 243,207
	
compass_east	
	.db 252,15
	.db 252,255
	.db 252,255
	.db 252,15
	.db 252,255
	.db 252,255
	.db 252,255
	.db 252,15	
	
	
;w=8h=8
compass_south
	.db 240,15
	.db 240,15
	.db 243,255
	.db 240,15
	.db 240,15
	.db 255,207
	.db 240,15
	.db 240,15
 	
compass_west
 	.db 207,207
	.db 207,207
	.db 207,207
	.db 204,207
	.db 204,207
	.db 195,15
	.db 207,207
	.db 255,255
 	
	
player_seen_sprite
; 	.db 3,51,15,63,48,51,204,12,12,48,60,204,12,60,48,195,60,243,48,51,51
;	.db 207,51,63,12,51,48,204,255,60,243,60,204,204,252,243,207,12,243,51,51,51
;	.db 207,51,15,51,51,48,12,15,60,48,60,204,12,60,48,195,0,252,243,51,51
;	.db 207,3,63,51,51,51,15,207,60,240,252,12,207,63,51,207,48,252,243,51,51
;	.db 207,51,63,63,51,51,207,207,60,243,60,204,207,63,51,207,60,252,243,51,63
;	.db 207,51,15,63,48,51,204,15,60,51,60,204,204,60,48,195,60,252,240,48,51
;6x13
	.db 243,48,243,48,48,240,195,12,243,204,192,204,207
	.db 243,51,243,51,51,243,207,60,51,204,204,204,207
	.db 240,48,243,48,48,240,195,12,3,243,204,204,207
	.db 243,51,240,51,60,252,207,60,195,243,204,204,207
	.db 243,51,243,51,60,252,207,60,243,243,204,204,255
	.db 243,48,243,51,48,240,195,12,243,243,192,192,207

	
;14 x 6
hunting_you
	.db 51,15,48,243,51,51,204,12,207,48,15,51,3,51
	.db 51,63,51,243,51,48,207,60,195,51,255,51,51,51
	.db 3,15,48,240,51,48,15,60,192,51,255,51,51,51
	.db 51,63,60,243,51,51,15,60,204,51,15,207,51,51
	.db 51,63,60,243,51,51,207,60,207,51,207,207,51,51
	.db 51,15,48,243,48,51,207,60,207,48,15,207,3,3	

;19x6	
footsteps_sprite
	.db 12,12,12,12,48,48,192,195,192,192,192,192,192,192,195,51,51,204,3
	.db 60,204,207,60,252,243,204,207,204,204,204,204,204,204,207,51,48,204,255
	.db 12,204,207,60,60,240,192,195,192,192,192,195,204,192,207,3,48,12,255
	.db 60,204,207,63,60,243,207,243,204,207,207,204,204,204,207,51,51,12,195
	.db 60,204,207,63,60,243,207,243,204,207,207,204,204,204,207,51,51,204,243
	.db 60,12,15,60,60,240,207,195,204,207,207,204,192,204,195,51,51,204,3	

;w=68h=6
beside_you_sprite

	.db 3,51,60,255,192,195,63,60,195,192,195,12,195,195,204,192,204
	.db 51,51,12,255,204,207,204,252,207,204,207,60,204,207,204,204,204
	.db 15,51,0,255,192,195,243,252,195,195,195,12,204,195,204,204,204
	.db 51,51,48,255,195,207,243,252,243,204,207,204,204,207,243,204,204
	.db 51,51,60,195,204,207,204,252,243,204,207,204,204,207,243,204,204
	.db 51,3,60,243,204,195,63,60,195,192,195,12,195,195,243,192,192

;w=72h=g	
behind_you_sprite
	.db 3,51,60,255,192,195,63,60,195,192,195,51,51,204,63,51,3,51
	.db 51,51,12,255,204,207,204,252,207,204,207,51,48,204,207,51,51,51
	.db 15,51,0,255,192,195,243,252,195,195,195,3,48,12,207,51,51,51
	.db 51,51,48,255,195,207,243,252,243,204,207,51,51,12,207,207,51,51
	.db 51,51,60,195,204,207,204,252,243,204,207,51,51,204,207,207,51,51
	.db 51,3,60,243,204,195,63,60,195,192,195,51,51,204,63,207,3,3


	
game_over_tile_map
	.dw black_tile,black_tile,black_tile,black_tile,black_tile,black_tile,black_tile,black_tile
	.dw orange_tooth,curved_tooth,black_tile,black_tile,black_tile,black_tile,black_tile,black_tile
	.dw orange_tile,orange_tile,orange_tooth,curved_tooth,black_tile,black_tile,black_tile,black_tile
	.dw orange_tile,orange_tile,orange_tile,orange_tile,orange_tooth,curved_tooth,black_tile,black_tile
	.dw orange_tile,orange_tile,orange_tile,orange_tile,orange_tile,orange_tile,orange_tooth,curved_tooth	
	.dw orange_tile,orange_tile,orange_tile,orange_tile,orange_tile,orange_tile,orange_tile,orange_tile
	.dw curved_tooth_up,orange_tooth_up,orange_tile,orange_tile,orange_tile,orange_tile,orange_tile,orange_tile
	.dw black_tile,black_tile,curved_tooth_up,orange_tile,orange_tile,orange_tile,orange_tile,orange_tile

;13 x 7
;retry_maze_sprite	
;	.db 3,12,12,12,207,63,60,240,48,192,243,63,195
;	.db 51,63,60,204,207,12,51,63,51,252,243,63,192
;	.db 15,15,60,63,63,51,48,60,240,192,252,252,204
;	.db 3,63,60,207,63,51,51,60,243,207,252,243,204
;	.db 51,63,60,207,63,63,51,51,243,255,252,207,204
;	.db 51,15,60,207,63,63,51,48,48,207,252,255,204

;14 x 6
map_help
	.db 51,243,60,12,12,3,0,207,12,15,243,243,3,3
	.db 48,195,63,60,204,255,63,207,60,255,240,195,51,51
	.db 240,3,255,60,204,255,63,207,12,15,240,3,3,3
	.db 243,51,255,60,204,195,48,207,63,207,243,51,51,63
	.db 243,243,255,60,204,243,60,207,63,207,243,243,51,63
	.db 243,243,255,60,12,3,0,195,12,15,243,243,51,63
;14 x 6
try_again_sprite
	.db 3,12,12,12,207,12,60,240,48,195,51,252,195,255
	.db 51,63,60,204,207,0,48,63,51,243,51,243,192,255
	.db 15,15,60,63,63,51,51,60,240,195,207,207,204,255
	.db 51,63,60,207,63,51,48,51,243,207,207,63,204,255
	.db 51,15,60,207,63,63,51,48,48,255,204,255,204,255
	.db 255,255,255,255,255,255,255,255,255,207,255,255,255,255	
;11 x 6
you_escaped_sprite
	.db 51,3,51,240,195,15,60,60,48,255,255
	.db 51,51,51,243,207,60,204,204,243,63,255
	.db 51,51,51,240,195,60,204,204,51,63,255
	.db 207,51,51,243,243,60,12,60,243,63,255
	.db 207,51,51,243,243,60,204,252,243,63,255
	.db 207,3,3,240,195,12,204,252,48,252,204

this_time_sprite ; 7 x 6
	.db 3,51,48,240,51,63,48
	.db 207,51,243,252,255,12,51
	.db 207,51,48,252,243,51,48
	.db 207,3,60,252,243,63,51
	.db 207,51,60,252,243,63,51
	.db 207,51,48,252,243,63,48
;14x6	(select a skill level)
skill_level_sprite
	.db 3,12,240,195,3,192,204,204,243,243,195,51,12,255
	.db 63,60,243,207,207,207,204,204,243,243,207,51,60,255
	.db 3,12,240,207,207,207,195,204,243,243,195,51,12,255
	.db 243,60,243,207,207,192,195,204,243,243,207,51,60,255
	.db 243,60,243,207,207,252,204,204,243,243,207,207,60,255
	.db 3,12,48,195,207,192,204,204,48,240,195,207,12,63	
;6x15	
skill_levels_sprite ; easy / hard
	.db 243,252,60,240,204,255
	.db 195,252,243,51,204,255
	.db 243,252,51,48,243,255
	.db 243,204,240,60,243,255
	.db 192,252,51,48,243,255
	.db 255,255,255,255,255,255
	.db 255,255,255,255,255,255
	.db 255,255,255,255,255,255
	.db 243,255,255,255,255,255
	.db 204,252,207,60,12,63
	.db 252,204,204,204,204,207
	.db 243,252,12,204,60,207
	.db 207,252,204,12,204,207
	.db 192,252,204,204,204,63
