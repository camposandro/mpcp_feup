include mpcp.inc

.data
resultado BYTE "Resultado = %d", 13, 10, 0
Valor DWORD 18

.code
main PROC C
	imul Valor
	invoke printf, offset resultado, eax
	;invoke_getch
	invoke ExitProcess, 0
main ENDP
end