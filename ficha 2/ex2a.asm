include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
sequencia DWORD a, b, c, 0
msg BYTE "Sequencia: %d", 13, 10, 0

;; seccao de codigo principal 
.code

main PROC C
	;; escrever codigo (parte principal)
		


	;; Terminar o programa: Não omitir!
		invoke	ExitProcess, 0

main ENDP
;; -----------------------------
;; codigo de outras rotinas

End
