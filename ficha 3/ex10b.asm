include mpcp.inc

.data
vecSize WORD 5
seq SDWORD 1,-1,3,4,5
msg BYTE "ELEMENTOS COM VALOR ABSOLUTO INFERIOR A 0FFH = %d", 13, 10, 0

.code
main PROC C
	xor ecx, ecx ; contador a 0
	mov DX, vecSize
	mov edi, offset seq
CICLO:	cmp DX, 0
	je FIM
	mov ebx, [edi]
	cmp ebx, 0
	jg POSITIVO
	neg ebx	
POSITIVO:
	cmp ebx, 0FFH
	jb COLOCAZERO
	add edi, 4
	dec DX
	jmp CICLO
COLOCAZERO:
	mov DWORD PTR [edi], 0
	add edi, 4
	dec DX
	jmp CICLO
FIM:	;invoke_getch
	invoke ExitProcess, 0
main ENDP
end
