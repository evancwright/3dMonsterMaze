;x contains addr of tile map
draw_tile_map
	pshs d,x,y
	lda #0
	ldb #0
	ldy vramAddr
@lp pshs x
	ldx ,x
	jsr draw_tile
	puls x
	leax 2,x ; move to next tile addr
	leay 4,y ; move 4 bytes over to next tile
	inca 
	cmpa #64 ; 64 tiles on screen
    beq @x
	incb
	cmpb #8
	bne @lp
	leay 768-32,y ; drop down one line of tiles
	ldb #0
	bra @lp
@x
	puls d,x,y
	rts


;,u = x ; in units of 4 pixels (one byte)
;1,u = y ; in pixels (height is 192 )
;2,u = w ; in units of 4 pixels (one byte)
;3,u = h ; in units of 4 pixels (one byte)
;4,u = fill color
fill_rect
	pshs d,x,y
	lda #0
	pshs a ; loop counter
	;compute v skip amount
	lda #32
	suba 2,u
	pshs a  ; push skip amount
	lda #32 ; row width in bytes
	ldb 1,u ; y
	mul
;	tfr d,x
;	leax VRAM,x  ; fixed this
	addd vramAddr
	tfr d,x
	ldb ,u  ; x
	abx
	lda #0 ; col counter 
@lp ;
	pshs a 
	lda 4,u ; fill square 
	sta ,x+
	puls a
	inca
	cmpa 2,u ; filled a row?
	bne @c
	;skip one row ()
	lda #0  ; reset x counter
	ldb ,s  ; skip amount
	abx  ; b is how many bytes to drop   
	dec 3,u ; dec row counter
	beq @x
@c	;
	bra @lp
@x	leas 2,s ; pop 2 params
	leau 5,u
	puls d,x,y
	rts

;copies a 16x16 tile to the 
;coords must be multiples of 4
;x contains the sprite addr
;y contains dest addr
;no screen bounds checking
draw_tile
	pshs d,x,y
 	lda #0
@ol	
	ldb #0  ; inner loop counter
@il	pshs a
	lda ,x+
	sta ,y
	puls a
	leay 1,y
	incb
	cmpb #4 ; sprites are 4 bytes wide
	bne @il 
	leay 28,y 	;drop down a line
	inca	
	cmpa #TILE_HEIGHT ;sprites are 16 rows tall
	bne @ol
	puls y,x,d
	rts

;copies a 16x16 tile to the 
;coords must be multiples of 4
;x contains the sprite addr
;y contains dest addr
;no screen bounds checking
and_tile
	pshs d,x,y
 	lda #0
@ol	
	ldb #0  ; inner loop counter
@il	pshs a
	lda ,y ; dest 
	anda ,x+ ; AND source onto dest
	sta ,y+ ; dest
	puls a
	incb
	cmpb #4 ; sprites are 4 bytes wide
	bne @il 
	leay 28,y 	;drop down a line
	inca	
	cmpa #TILE_HEIGHT ;sprites are 16 rows tall
	bne @ol
	puls y,x,d
	rts
	
;copies a 16x16 tile to the 
;coords must be multiples of 4
;x contains the sprite addr
;y contains dest addr
;no screen bounds checking
or_tile
	pshs d,x,y
 	lda #0
@ol	
	ldb #0  ; inner loop counter
@il	pshs a
	lda ,y ; dest 
	ora ,x+ ; AND source onto dest
	sta ,y+ ; dest
	puls a
	incb
	cmpb #4 ; sprites are 4 bytes wide
	bne @il 
	leay 28,y 	;drop down a line
	inca	
	cmpa #TILE_HEIGHT ;sprites are 16 rows tall
	bne @ol
	puls y,x,d
	rts

;mask_tile(mask,tile)
;ab=x,y	
;u = mask
;user stack is popped by this call
;function clears up params
;uses a mask to draw the sprit
mask_tile_2
	jsr set_draw_offset
	pulu x 
	jsr and_tile
	pulu x
	jsr set_draw_offset
	jsr or_tile
	rts
	
	

;a=x,b=y
;a,b are in 'tiles' (not bytes or pixels)
;resulting offset is in y
;computes   
set_draw_offset
	pshs d,x
	asla ; a * 4
	asla
	pshs a
	ldy #0
@lp	cmpb #0
	beq @d
	leay 768,y ; each line of tiles is 768 bytes
	decb
	bra @lp
@d  puls b   ; pop a*4 (how to add to x?)
	tfr y,x
	abx	; add b to x
;	leax VRAM,x
	tfr x,d
	addd vramAddr
	tfr d,y
	puls d,x
	rts

	
;draw_sprite
; a = screen x in bytes (units of 4 pixels)
; b = screen y in pixels
; ,u = height (in pixels)
; 1,u = width (in bytes = units of 4 pixels)
; y = sprite src
draw_sprite
	pshs d,x,y
	pshs a ; save x offset
	lda #32  ;draw = y* width in bytes + x
	mul
	tfr d,x
	puls b  ; add x to addr
	abx
;	leax VRAM,x		
	pshs d
	tfr x,d
	addd vramAddr
	tfr d,x
	puls d
	lda #32 ; (vksip = -1 * (32 - w) )
	suba 1,u
	sta vskip
	;a is outer loop (rows)
	;b is inner loop (cols)
	clra
@ol 
	clrb
	pshs a
@il 
	lda ,y+
	sta ,x+
	incb
	cmpb  1,u ; end of row
	bne @il	
	ldb vskip
	abx
	clrb
	puls a ;restore outer loop counter
	inca
	cmpa ,u  ; copied all rows?
	bne @ol
	bra @x
@x	leau 2,u  ; pop h,w params
	puls d,x,y
	rts	


;draw_mask
; a = screen x in bytes (units of 4 pixels)
; b = screen y in pixels
; ,u = height (in pixels)
; 1,u = width (in bytes = units of 4 pixels)
; y = sprite src
draw_mask
	pshs d,x,y
	pshs a ; save x offset
	lda #32  ;draw = y* width in bytes + x
	mul
	tfr d,x
	puls b  ; add x to addr
	abx
	pshs d
	tfr x,d  ; fixed this
	addd vramAddr
	tfr d,x
	puls d
;	leax VRAM,x		
	lda #32 ; (vksip = -1 * (32 - w) )
	suba 1,u
	sta vskip
	;a is outer loop (rows)
	;b is inner loop (cols)
	clra
@ol 
	clrb
	pshs a
@il 
	lda ,x ;  load dest
	anda ,y+  ; AND mask onto it
	sta ,x+   ; write byte back
	incb
	cmpb  1,u ; end of row
	bne @il	
	ldb vskip
	abx
	clrb
	puls a ;restore outer loop counter
	inca
	cmpa ,u  ; copied all rows?
	bne @ol
	bra @x
@x	leau 2,u  ; pop h,w params
	puls d,x,y
	rts	
	
or_sprite
	pshs d,x,y
	pshs a ; save x offset
	lda #32  ;draw = y* width in bytes + x
	mul
	tfr d,x
	puls b  ; add x to addr
	abx
	pshs d
	tfr x,d
	addd vramAddr
	tfr d,x
	puls d
;	leax VRAM,x		
	lda #32 ; (vksip = -1 * (32 - w) )
	suba 1,u
	sta vskip
	;a is outer loop (rows)
	;b is inner loop (cols)
	clra
@ol 
	clrb
	pshs a
@il 
	lda ,x ;  load dest
	ora ,y+  ; OR mask onto it
	sta ,x+   ; write byte back
	incb
	cmpb  1,u ; end of row
	bne @il	
	ldb vskip
	abx
	clrb
	puls a ;restore outer loop counter
	inca
	cmpa ,u  ; copied all rows?
	bne @ol
	bra @x
@x	leau 2,u  ; pop h,w params
	puls d,x,y
	rts
	
;draw_sprite_hflipped
; a = screen x in bytes (units of 4 pixels)
; b = screen y in pixels
; ,u = height (in pixels)
; 1,u = width (in bytes = units of 4 pixels)
; y = sprite src	
draw_sprite_hflipped
	pshs d,x,y
	pshs a ; save x offset
	lda #32  ;draw = y* width in bytes + x
	mul
	tfr d,x
	puls b  ; add x to addr
	abx
	pshs d
	tfr x,d
	addd vramAddr
	tfr d,x
	puls d
	ldb 1,u ; add w-1 to draw offset (to start at right)
	decb
	abx 
	decb
	lda #32 ; (vksip = -1 * (32 - w) )
	suba 1,u
	sta vskip
	;a is outer loop (rows)
	;b is inner loop (cols)
	clra
@ol 
	clrb
	pshs a
@il 
	lda ,y+  ; inc src addr
	;reverse the byte
    pshs b
	clrb
	bita #0C0h ; test bits 6,7 
	beq @d
	orb #3  ; set bits 0,1
@d	bita #30h ; isolate bits 4,5
	beq @a
	orb #0Ch  ; 00001100
@a	bita #0Ch ; isolate bits 2,3
	beq @b
	orb #30h  ; | 00110000
@b	bita #03h ; isolate bits 0,1
	beq @c
	orb #0C0h  ; | 11000000
@c	
	stb ,x  ; dec desc addr
	puls b
	leax -1,x
	incb
	cmpb  1,u ; end of row
	bne @il	
	ldb 1,u ; b = w
	lslb ; times 2
	abx
	ldb vskip
	abx 
	clrb
	puls a ;restore outer loop counter
	inca
	cmpa ,u  ; copied all rows?
	bne @ol
	bra @x  ; ?
@x	leau 2,u  ; pop h,w params
	puls d,x,y
	rts

;a contains height
;y contains start byte
draw_left_edge
	pshs a 
	tfr y,d
	addd vramAddr
	tfr d,y
	puls a
@lp	ldb ,y
	andb  #0x3f ; clear leftmost 2 bits
	stb ,y
	leay 32,y ; drop down to next line
	deca
	bne @lp
	rts
	
draw_right_edge
	pshs a 
	tfr y,d
	addd vramAddr
	tfr d,y
	puls a
@lp	ldb ,y
	andb  #0xFC ; clear rightmost 2 bits
	stb ,y
	leay 32,y ; drop down to next line
	deca
	bne @lp
	rts 
