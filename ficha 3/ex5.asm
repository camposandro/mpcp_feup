include mpcp.inc

.data
val1 WORD 3
val2 WORD 4
resultado BYTE "eax = %d", 13, 10, 0

.code
main PROC C
	xor eax, eax
	mov AX, val1
	imul val2
	shl edx, 16
	or eax, edx
	invoke printf, offset resultado, eax
	;invoke_getch
	invoke ExitProcess, 0
main ENDP
end