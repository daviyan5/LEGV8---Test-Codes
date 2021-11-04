	.globl test
test:					// X0 = a* X1 = *b
	MOV X3,X30 			// Salva o valor de retorno

	MOV X8,X0
	BL calcula_pontos
	MOV X4,X9 			// Pontuação de A

	MOV X8,X1
	BL calcula_pontos
	MOV X5,X9 			// Pontuação de B

	CMP X4,X5
	B.EQ Empate
	B.GT Jogador1
	B.LT Jogador2

	Empate:
		MOV X0,#69 	//E
		BR X3
	Jogador1:
		MOV X0,#65 	//A
		BR X3
	Jogador2:
		MOV X0,#66	//B
		BR X3

// Recebe: X8 -> Endereço, Retorna: X9 = Pontuação (X30 guarda o valor de retorno)
calcula_pontos:
	EOR X9,X9,X9
	// X10 -> Ponteiro que percorre a string
	loop:
		LDRSB X10,[X8,#0]
		CBZ X10,fim 		// fim da string?
		ADD X8,X8,#1

		// 01 pontos
		CMP X10,#65 //A
		B.EQ inc01
		CMP X10,#69 //E
		B.EQ inc01
		CMP X10,#73 //I
		B.EQ inc01
		CMP X10,#79 //O
		B.EQ inc01
		CMP X10,#85 //U
		B.EQ inc01

		// 02 pontos
		CMP X10,#68 //D
		B.EQ inc02
		CMP X10,#71 //G
		B.EQ inc02
		CMP X10,#84 //T
		B.EQ inc02

		// 03 pontos
		CMP X10,#66 //B
		B.EQ inc03
		CMP X10,#67 //C
		B.EQ inc03
		CMP X10,#77 //M
		B.EQ inc03
		CMP X10,#78 //N
		B.EQ inc03
		CMP X10,#80 //P
		B.EQ inc03

		// 04 pontos
		CMP X10,#70 //F
		B.EQ inc04
		CMP X10,#72 //H
		B.EQ inc04
		CMP X10,#86 //V
		B.EQ inc04
		CMP X10,#87 //W
		B.EQ inc04
		CMP X10,#89 //Y
		B.EQ inc04

		// 05 pontos
		CMP X10,#75 //K
		B.EQ inc05
		CMP X10,#82 //R
		B.EQ inc05
		CMP X10,#83 //S
		B.EQ inc05

		// 08 pontos
		CMP X10,#74 //J
		B.EQ inc08
		CMP X10,#76 //L
		B.EQ inc08
		CMP X10,#88 //X
		B.EQ inc08

		// 10 pontos
		CMP X10,#81 //Q
		B.EQ inc10
		CMP X10,#90 //Z
		B.EQ inc10

		B loop
	fim:
		BR X30

inc01:
	ADD X9,X9,#1
	B loop
inc02:
	ADD X9,X9,#2
	B loop
inc03:
	ADD X9,X9,#3
	B loop
inc04:
	ADD X9,X9,#4
	B loop
inc05:
	ADD X9,X9,#5
	B loop
inc08:
	ADD X9,X9,#8
	B loop
inc10:
	ADD X9,X9,#10
	B loop
