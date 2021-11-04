	.globl test
test:	// X0 = a, X1 = b, X2 = c
	MOV X8,X0 	// Salva a

	MOV X0,#0
	CMP X8,#0
	BLT end
	CMP X1,#32
	BGT end
	CMP X2,#25
	BLE end
	MOV x0,#1
	end:
		BR	X30
