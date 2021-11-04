	.globl test
test:	// X0 = a, X1 = b
	MOV X8,#0xFFFFFFFFFFFFFFFF
	EOR X0,X0,X8
	BR	X30
