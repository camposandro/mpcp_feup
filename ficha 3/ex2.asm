include mpcp.inc

.data
value DWORD 9h
msg BYTE "THE MSB AT 1 IS IN POSITION %d", 13, 10, 0
msg2 BYTE "NO BITS AT 1", 13, 10, 0

.code
main PROC C
	mov edi, offset value
	mov eax, [edi]
	mov ecx, 32
CICLO:	jecxz ZERO
	shl eax, 1
	jc FOUND
	dec ecx
	jmp CICLO   
ZERO:	invoke printf, offset msg2, 0
	jmp FIM
FOUND:  sub ecx, 1
	invoke printf, offset msg, ecx 
FIM:	invoke	ExitProcess, 0
main ENDP
End
