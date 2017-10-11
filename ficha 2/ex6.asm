include mpcp.inc

.data
seq SBYTE 1,-2,3,4,5,-6
msg SBYTE "Somador: %d", 13, 10, 0

.code
main PROC C
	mov edi, offset seq
	mov ecx, LENGTHOF seq
	xor eax, eax
ciclo:	add eax, [edi]
	inc edi
	loop ciclo
fim:	invoke printf, offset msg, eax
	;invoke_getch
	;; Terminar o programa: Não omitir!
	invoke ExitProcess, 0
main ENDP
End
