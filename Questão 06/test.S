	.globl test
test:	// X0 = a*
	EOR X8,X8,X8 // Zera X8, contador
	EOR X9,X9,X9
	loop:
		LDRSB  X9,[X0,#0]
		CBZ X9,fim 		// fim da string?
		ADD X0,X0,#1
		CMP X9,#97
		B.EQ inc
		CMP X9,#101
		B.EQ inc
		CMP X9,#105
		B.EQ inc
		CMP X9,#111
		B.EQ inc
		CMP X9,#117
		B.EQ inc
		B loop
	fim:
		MOV X0,X8
		BR	X30
	inc:
		ADD X8,X8,#1
		B loop
