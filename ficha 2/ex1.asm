include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seq BYTE "ABCDE", 0
msg BYTE "Contador: %d", 13, 10, 0

;; seccao de codigo principal 
.code

main PROC C
	;; escrever codigo (parte principal)
		mov edi, offset seq
		mov eax, 0
ciclo:	mov ecx, [edi]
		add edi, 4
		cmp ecx, 0
		jecxz fim
		inc eax
		jmp ciclo
fim:	invoke printf, offset msg, eax
	;	invoke_getch
	;; Terminar o programa: Não omitir!
		invoke	ExitProcess, 0

main ENDP
;; -----------------------------
;; codigo de outras rotinas

End
