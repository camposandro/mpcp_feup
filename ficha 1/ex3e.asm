include mpcp.inc

.data
msg BYTE "AMOUNT OF PAIR NUMBERS IN MEMORY BETWEEN POSITIONS 10F000H AND 11B003H = %d", 13, 10, 0

.code
main PROC C
		xor eax, eax
		mov edi, 10F000H ;; pesquisa em memoria entre
CICLO:	cmp edi, 11B003H ;; as posicoes 10F000H e 11B003H 
		ja FIM 
		mov ebx, [edi]
		add edi, 4
		shr ebx, 1
		jc CICLO ;; se bit mais significativo 1 entao impar
		inc eax ;; se par incrementa-se eax
		jmp CICLO
FIM:	invoke printf, offset msg, eax
		;invoke_getch
		invoke ExitProcess, 0
main ENDP

End