include mpcp.inc

.data
msg BYTE "NUMBER OF UPPERCASES IN MEMORY FROM POSITION AAF000H TO BB003H = %d", 13, 10, 0

.code
main PROC C
		xor eax, eax ;; inicializacao do contador
		mov edi, 0AAF000H ;; posicao de memoria inicial
CICLO:	cmp edi, 0BB003H ;; posicao de memoria final
		ja FIM
		mov ebx, [edi]
		inc edi
		.IF ebx >= 41H && ebx <= 5AH ;; se for letra maiuscula
		inc eax
		.ELSE
		jmp CICLO 
		.ENDIF
FIM:	invoke printf, offset msg, eax
		;invoke_getch
		invoke ExitProcess, 0
main ENDP

End