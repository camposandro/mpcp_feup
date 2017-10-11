include mpcp.inc

.data
msg BYTE "NUMBER OF BITS AT 1 = %d", 13, 10, 0

.code
main PROC C
	   mov ebx, 0FFFFFFFFH ;valor do numero
	   mov ecx, 33 ;numero de bits do numero
	   xor eax, eax ;contador de bits a 1
CICLO: dec ecx
	   jecxz FIM
	   shr ebx, 1
	   jnc CICLO
	   inc eax
	   jmp CICLO
FIM:   invoke printf, offset msg, eax
	   ;invoke_getch
	   invoke ExitProcess, 0
main ENDP

End	