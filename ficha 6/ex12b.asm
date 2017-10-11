include mpcp.inc

somaMat proto matrizA: ptr word, matrizB: ptr word, matrizSum: ptr word, N: dword, M: dword

.data
nLinhas dword 2
nColunas dword 2
matrixA word 7,0,8,4
matrixB word 1,4,5,2
matrixSum word (lengthof matrixA) DUP (0)
msg byte "MatrizProd:", 0
fmt byte " %d ", 0

.code
main proc c
	invoke printf, offset msg
	invoke somaMat, offset matrixA, offset matrixB, offset matrixSum, nLinhas, nColunas

	mov esi, offset matrixSum
	mov ecx, lengthof matrixA
@@:	invoke printf, offset fmt, word ptr [esi]
	add esi, 2
	loop @B

	invoke ExitProcess, 0
main endp

prodMat proto matrizA: ptr word, nA: dword, mA: dword, matrizB: ptr word, nB: dword, mB: dword, matrizSum: ptr word
	xor ax, ax ;; somador
	mov esi, matrizA
	mov edi, matrizB
	mov ecx, vsize
	...
prodMat endp

end