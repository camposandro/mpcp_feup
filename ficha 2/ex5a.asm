include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seq DWORD 5555 457821453 12145

;; seccao de codigo principal 
.code

main PROC C
	;; escrever codigo (parte principal)
	   xor eax, eax
	   xor DI, DI
	   mov edi, offset seq
	   mov ecx, LENGTHOF seq
; testa se valor e representavel
teste: mov ebx, [edi]
	   shr ebx, 16 
	   cmp ebx, FFFFh
	   jz tratarvalor
	   cmp ebx, 0
	   jz tratarvalor
tratarvalor: mov [edi]
		jmp ciclo

	;; Terminar o programa: Não omitir!
		invoke	ExitProcess, 0

main ENDP
;; -----------------------------
;; codigo de outras rotinas

End