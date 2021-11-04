	.globl test
test:	// X0 = a
	loop:
		CBZ X0, fim
		SUB X0,X0,#1
		B loop
	fim:
		BR	X30
