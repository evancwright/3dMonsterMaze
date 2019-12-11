;variable locations
maze_data EQU $400 ; 1024 decimal
direction EQU $569 ;  
vskip EQU $56A ; .db 0	 ; two's complement
temp_word EQU $56B ;	.dw 0
sstack_save EQU $56D ; .dw 0
ustack_save EQU $56F ; .dw 0
static_start EQU $571 ; .dw 0
rv_save EQU $573 ; .dw 0 ; reset vector save
left_tap EQU $574  		;.db 0x00
right_tap EQU $575  		;.db 0x00
xor_rslt EQU $576		;.db 0x00
cur_rand EQU $577     ; dw
left_tap_mask EQU $579 ; db 
right_tap_mask EQU $57A ; db 
vramAddr EQU $57B ; .dw
limit EQU $57D ; .db 0 ; boundry to check for in direction of motion 1 or 17
limitVar EQU $57E ; .dw  0 ; address of variable to check (cursorX or cursorY)
passageLen EQU $580 ; .db 0
cursorDir EQU $581 ; .db 0
cursorX EQU $582 ; .db 17
cursorY EQU $583 ; .db 17
cursor EQU $584 ; .dw START_OFFSET  ; should be bottom right corner
showMap EQU $586 ; .db 0
exit_ptr EQU $587	; .dw 0 
monster_message EQU $589 ; .db 0 ; 0 / BEHIND / TO_SIDE
monster_orientation EQU $58A ; .db 0
one_in_msb EQU $58B	;	.db 0x80
bufferNum  EQU $58C ; .db 0	
diff_x EQU $58D ; .db 0
diff_y EQU $58E ; .db 0
diff_sum EQU $58F ; .db 0
xcoord EQU $590 ; .db 0
ycoord EQU $591 ; .db 0
exit_x EQU $592 ; .db 0
exit_y EQU $593 ; .db 0
xdiff EQU $594  ;.db 0
ydiff EQU $595 ; .db 0
player_seen EQU $596 ; .db 0
prev_state EQU $597 ; .db IDLE=0
monster_state EQU $598 ; .db IDLE=0
ticks EQU $599 ;  .dw 0
monster_x EQU $59B ; .db 0
monster_y EQU $59C ; =.db 0
player_x EQU $59D ; .db 0
player_y EQU $59E ; .db 0
monster_direction EQU $59F ; db 0
player_location EQU $5A0  ; .dw maze_data+MAZE_WIDTH*15+2
monster_location EQU $5A2 ; .dw maze_data+MAZE_WIDTH*3+1
;what the player sees
left1_tile EQU $5A4 ; .db 0
left2_tile  EQU $5A5 ; .db 1
left3_tile  EQU $5A6 ; .db 0
left4_tile  EQU $5A7 ; .db 1
left5_tile  EQU $5A8 ; .db 0

right1_tile  EQU $5A9 ; .db 1
right2_tile  EQU $5AA ; .db 0
right3_tile  EQU $5AB ; .db 1
right4_tile  EQU $5AC ; .db 0
right5_tile  EQU $5AD ; .db 1

front1_tile  EQU $5AE ; .db 0
front2_tile  EQU $5AF ; .db 0
front3_tile EQU $5B0 ; .db 0
front4_tile EQU $5B1 ; .db $5B3 ; 0
front5_tile EQU $5B2 ; .db 0

exitRows EQU $5B3 ; used for copying exit data to maze
exitCols EQU $5B4 ; used for copying exit data to maze
cheat EQU $5B5 ;show entire map
monsterTicks EQU $5B6 ; how fast to update monster
