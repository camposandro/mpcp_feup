include mpcp.inc

.data
seq DWORD 11,21,31,41,51,61,71,81,91,101
result BYTE "SUM = %d", 13, 10, 0

.code
main PROC C
	   mov ecx, LENGTHOF seq
	   mov edi, offset seq
	   xor eax, eax
CICLO: jecxz FIM
	   add eax, [edi]
	   add edi, 4
	   dec ecx
	   jmp CICLO
FIM:   invoke printf, offset result, eax
	   ;invoke_getch
	   invoke ExitProcess, 0
main ENDP

End

