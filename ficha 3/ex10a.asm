include mpcp.inc

;; teste para eax = 1 com sequencia 1,-1,3,4,5 -> resultado = 2

.data
vecSize WORD 5
seq SDWORD 1,-1,3,4,5
msg BYTE "ELEMENTOS IGUAIS EM VALOR ABSOLUTO AO CONTEUDO DE EAX = %d", 13, 10, 0

.code
main PROC C
	xor ecx, ecx ; contador a 0
	mov DX, vecSize
	mov edi, offset seq
	mov eax, 1
CICLO:	cmp DX, 0
	je FIM
	mov ebx, [edi]
	add edi, 4
	dec DX
	cmp ebx, eax
	je FOUND ;valor igual positivo
	neg ebx
	cmp ebx, eax
	je FOUND ;se valor for igual em negativo
	jmp CICLO
FOUND: 	inc ecx
	jmp CICLO
FIM: 	invoke printf, offset msg, ecx
	;invoke_getch
	invoke ExitProcess, 0
main ENDP
end
