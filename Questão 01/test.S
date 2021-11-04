	.globl test
test:
	MOV X8,X1 	// Salva B
	SUB X1,X1,X0		// b = b - a
	CBZ X1,Caso1		// b == 0? -> b == a

	SUB X0,X0,X8		// 2 caso, X0 = a - b
	B End
	Caso1:
		SUB X0,X8,X0	// 1 caso, X0 = b - a
	End:
		BR	X30
