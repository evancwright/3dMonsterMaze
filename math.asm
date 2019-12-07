 
;16 bit mod
;top of stack is number
;under it is divisor
;the result is returned on the stack
mod2b
	pshs d,x,y
	pulu d ; get number
	lda #0
@lp cmpd ,u
	bcs @x
	subd ,u
	bra @lp
@x	pulu x	; pop divisor
	pshu d ; put result on stack
	puls y,x,d
	rts
		