include mpcp.inc

.data
vecSize WORD 5
seq SDWORD 1,-1,3,4,5
msg BYTE "NUMERO DE ELEMENTOS CONTIDOS EM [eax,ebx] = %d", 13, 10, 0

.code
main PROC C
	xor ecx, ecx ; inicializa contador	
	mov esi, offset seq
	mov DX, vecSize

	; valores teste para os limites do intervalo
	mov eax, -5
	mov ebx, 10
	; ------------------------------------------

	inc DX ; necessario devido a primeira inc
CICLO:
	cmp DX, 0
	je FIM
	add esi, 4
	dec DX
	mov edi, [esi - 4]
	cmp edi, eax
	jnge CICLO

CONTINUA:
	cmp edi, ebx
	jle CONTIDO
	jmp CICLO

CONTIDO:
	inc ecx
	jmp CICLO

FIM:
	invoke printf, offset msg, ecx
	; invoke_getch
	invoke ExitProcess, 0




	



main ENDP
end