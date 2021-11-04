	.globl test
test:					// X0 = a*
	MOV X19,X30			// Salva o return
	EOR X10,X10,X10		//X10 guarda a pontuação
	loop:
		LDRSB X8,[X0,#0]
		CBZ X8, fim 		// fim da string?
		ADD X0,X0, #1

		SUB X8,X8,#48
		BL fatorial
		ADD X10,X10,X9
		B loop

	fim:
		MOV X0,X10
		BR X19


// Recebe : Numero em X8 (ULTIMO RETORNO EM X30)
// Retorna: Resposta em X9
fatorial:
	SUB SP,SP,#16
	STUR X30,[SP,#8]
	STUR X8,[SP,#0]
	CMP X8, #1
	BGT prox 		// Se for maior que 1

	MOV X9,#1 		// Se não, X9 = 1
	ADD SP,SP,#16
	BR X30

	prox:
		SUB X8,X8,#1
		BL fatorial
		LDUR X30,[SP,#8] 	// retorno de n + 1
		LDUR X8,[SP,#0] 	// n
		ADD SP,SP,#16
		MUL X9,X8,X9 		// X9 = X8 * X9
		BR X30

