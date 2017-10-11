include mpcp.inc

somaMat proto matrizA: ptr word, matrizB: ptr word, matrizSum: ptr word, N: dword, M: dword

.data
nLinhas dword 2
nColunas dword 2
matrixA word 7,0,8,4
matrixB word 1,4,5,2
matrixSum word (lengthof matrixA) DUP (0)
msg byte "MatrizSum:", 0
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

somaMat proc matrizA: ptr word, matrizB: ptr word, matrizSum: ptr word, N: dword, M: dword
	mov eax, N
	mul M
	jo fim
	mov ecx, eax
	
	mov eax, matrizA
	mov ebx, matrizB
	mov edi, matrizSum

@@:	mov dx, word ptr [eax]
	add dx, word ptr [ebx]
	mov word ptr [edi], dx
	add eax, 2
	add ebx, 2
	add edi, 2
	loop @B
fim:
	ret
somaMat endp

end