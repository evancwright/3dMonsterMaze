;wumpus sprite data
;Evan Wright, 2018


sprite_wumpus_left
	.db 255,255,213,85
	.db 255,255,213,85
	.db 255,255,85,85
	.db 255,255,85,117
	.db 255,253,85,253
	.db 255,253,85,237
	.db 255,245,85,85
	.db 255,245,85,85
	.db 255,213,85,85
	.db 255,85,213,85
	.db 255,85,220,204
	.db 255,95,220,204
	.db 255,95,208,0
	.db 255,95,220,0
	.db 255,95,220,204
	.db 255,95,212,204
	.db 255,95,213,85
	.db 255,95,213,85
	.db 255,87,245,85
	.db 255,213,253,85
	.db 255,245,127,85
	.db 255,253,95,255
	.db 255,253,87,255
	.db 255,245,245,255

sprite_wumpus_right
	.db 85,87,255,255
	.db 85,87,255,255
	.db 85,85,255,255
	.db 93,85,255,255
	.db 127,85,127,255
	.db 123,85,127,255
	.db 85,85,95,255
	.db 85,85,95,255
	.db 85,85,87,255
	.db 85,87,85,255
	.db 51,55,85,255
	.db 51,55,245,255
	.db 0,7,245,255
	.db 0,55,245,255
	.db 51,55,245,255
	.db 51,23,245,255
	.db 85,87,245,255
	.db 85,87,245,255
	.db 85,95,213,255
	.db 85,127,87,255
	.db 85,253,95,255
	.db 255,245,127,255
	.db 255,213,127,255
	.db 255,95,95,255
	
sprite_2019 ; 4 x 7
	.db 195,192,204,15
	.db 60,204,204,207
	.db 252,204,204,207
	.db 252,204,204,15
	.db 243,204,207,207
	.db 207,204,207,207
	.db 0,192,207,207
 	 
press_a_key	; 12 x 6
	.db 240,48,48,192,192,240,51,204,207,51,12,207
	.db 243,51,51,207,207,243,48,204,207,51,60,207
	.db 240,48,48,192,192,240,48,12,207,15,12,207
	.db 243,240,243,252,252,243,51,15,63,15,63,63
	.db 243,243,51,252,252,243,51,207,63,51,63,63
	.db 243,243,48,192,192,243,51,207,63,51,15,63

 
color_calibration
 	.db 255,255,255,255
	.db 255,255,255,255
	.db 255,255,255,255
	.db 3,12,63,250
	.db 51,60,207,250
	.db 3,12,207,250
	.db 15,60,207,250
	.db 51,60,207,250
	.db 51,12,63,250
	.db 255,255,255,255
	.db 255,255,255,255
	.db 3,60,204,53
	.db 51,60,204,245
	.db 15,60,204,53
	.db 3,60,204,245
	.db 51,60,204,245
	.db 3,12,12,53
	.db 255,255,255,255
	.db 255,255,255,255
	.db 255,255,255,255
	.db 255,255,255,255
	.db 255,255,255,255
	.db 255,255,255,255
	.db 255,255,255,255

 
play_again
;	.db 3,3,3,3,3,252,12,240,51,60,12,3,3,51,207
;	.db 63,51,51,63,63,252,204,243,51,60,204,255,51,48,207
;	.db 3,3,51,63,3,12,12,243,51,60,204,195,51,48,207
;	.db 243,63,3,63,63,252,252,240,60,252,12,243,3,51,15
;	.db 243,63,51,63,63,12,252,243,60,252,204,243,51,51,15
;	.db 3,63,51,3,3,252,252,51,60,252,204,3,51,51,207
	;11 x 6
	.db 3,252,12,252,12,207,3,0,192,204,243
	.db 51,12,204,252,204,207,51,63,204,204,51
	.db 3,252,12,252,12,207,3,63,192,204,51
	.db 63,12,252,252,207,63,51,48,204,204,195
	.db 63,252,252,252,207,63,51,60,204,204,195
	.db 63,252,252,12,207,63,51,0,204,204,243	
 
press_reset  ; 12 x 22	
	.db 255,3,3,12,12,15,192,195,3,12,15,255
	.db 255,51,51,60,252,255,204,207,63,63,63,255
	.db 255,3,3,12,12,15,192,195,3,15,63,255
	.db 255,63,15,63,207,207,195,207,243,63,63,255
	.db 255,63,51,63,207,207,204,207,243,63,63,255
	.db 255,63,51,12,12,15,204,195,3,15,63,255
	.db 255,255,255,255,255,255,255,255,255,255,255,255
	.db 255,255,255,255,255,255,255,255,255,255,255,255
	.db 51,60,192,204,255,207,204,204,252,192,204,192
	.db 51,12,243,204,255,207,204,204,48,204,204,207
	.db 51,0,243,204,255,207,204,204,204,192,204,192
	.db 51,48,243,204,255,204,204,204,252,207,204,252
	.db 51,60,243,204,255,195,12,204,252,207,204,252
	.db 3,60,243,204,63,207,204,12,252,207,192,192
	.db 255,255,255,255,255,255,255,255,255,255,255,255
	.db 255,255,255,255,255,255,255,255,255,255,255,255
	.db 255,255,255,48,60,12,243,48,63,255,255,255
	.db 255,255,255,51,252,204,243,51,255,255,255,255
	.db 255,255,255,48,60,12,243,48,63,255,255,255
	.db 255,255,255,63,60,204,243,51,255,255,255,255
	.db 255,255,255,63,60,204,243,51,255,255,255,255
	.db 255,255,255,48,60,12,48,48,63,255,255,255

 
if_correct ; 9 x 6
	.db 48,60,12,12,12,12,12,12,15
	.db 51,252,252,204,204,204,252,255,63
	.db 48,60,252,204,12,12,12,255,63
	.db 51,252,252,204,60,60,252,255,63
	.db 51,252,252,204,204,204,252,255,63
	.db 51,252,12,12,204,204,12,15,63
	