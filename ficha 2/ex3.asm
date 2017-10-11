include mpcp.inc

.data
seq DWORD 5,6,10
msg BYTE "SEQUENCIA NAO CRESCENTE", 13, 10, 0
msg2 BYTE "SEQUENCIA CRESCENTE", 13, 10, 0

.code
main PROC C
		mov esi, OFFSET seq ; endereco seq
		mov ecx, LENGTHOF seq ; contador
		dec ecx

CICLO:	mov ebx, [esi]
		mov edi, [esi + 4] ; 2o elem 
		add esi, 4 ; incrementar para prox. iteracao
		cmp edi, ebx
		jbe DECR ; decrescente
		loop CICLO
CRES:	invoke printf, offset msg2, 0
		jmp FIM
DECR:	invoke printf, offset msg, 0

FIM:	;invoke_getch
		invoke ExitProcess, 0

main ENDP
End