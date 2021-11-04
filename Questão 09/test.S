	.globl test
test:					// X0 = *a //X1 = *b // X2 = *freqA // X3 = *freqB
	MOV X8, #0
	MOV X4, #8			// Constante = 8
	zera: 				// Zera os elementos em X2, usando X8
		CMP X8, #208 	// 26 * 8
		BGE loop1
		STR XZR, [X2,X8]
		STR XZR, [X3,X8]
		ADD X8,X8,#8
		B zera
	loop1:
		LDRSB X8,[X0,#0]
		CBZ X8,loop2 		// Fim da string?
		ADD X0,X0,#1
		SUB X8,X8,#97
		MUL X8,X8,X4		// X8 = (X8 - 'a') * 8
		LDR X9, [X2,X8] 	// Carrego a frequência
		ADD X9,X9,#1 		// Incremento
		STR X9, [X2,X8] 	// Salvo a frequência
		B loop1
	loop2:
		LDRSB X8,[X1,#0]
		CBZ X8,compara 		// Fim da string?
		ADD X1,X1,#1
		SUB X8,X8,#97
		MUL X8,X8,X4		// X8 = (X8 - 'a') * 8
		LDR X9, [X3,X8] 	// Carrego a frequência
		ADD X9,X9,#1 		// Incremento
		STR X9, [X3,X8] 	// Salvo a frequência
		B loop2
	compara:
		MOV X8, #0
		MOV X0, #100 		// "Máximo"
		loop3:
			CMP X8, #208
			BGE fim
			LDR X9, [X3,X8]
			CMP X9, #0
			BEQ prox
			LDR X10,[X2,X8] // x10 = freqA[c], x9 = freqB[c]
			UDIV X10,X10,X9 // X10 = X10/X9
			CMP X0, X10		// SE X0 > X10, X0 = X10, SENAO, X0 = X0
			BGT caso2
			MOV X10,X0
			caso2:
				MOV X0,X10
			prox:
				ADD X8,X8,#8
			B loop3
		fim:
			BR X30
