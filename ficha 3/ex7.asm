include mpcp.inc

.data
vec1 SDWORD 7FFFFFFFH
vec2 SDWORD 7FFFFFFFH
somador SDWORD 0
msg BYTE "Produto interno dos vetores = %d", 13, 10, 0
msg2 BYTE "Ocorreu overflow", 13, 10, 0

.code
main PROC C
	;; eax variavel para mult
	mov esi, offset vec1
	mov edi, offset vec2
	mov ecx, lengthof vec1

ciclo:	mov eax, [esi]
	imul SDWORD PTR [edi]
	jo overflow
	add somador, eax
	jo overflow
	add esi, 4
	add edi, 4
	loop ciclo
	jmp imprimevalor

overflow:
	invoke printf, offset msg2, 0
	jmp fim 
	
imprimevalor:
	invoke printf, offset msg, edx
	jmp fim
	 
fim:	;invoke_getch
	invoke ExitProcess, 0
main ENDP
end
