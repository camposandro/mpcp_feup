include mpcp.inc

.data
resultado BYTE "Resultado = %d", 13, 10, 0

.code
main PROC C
;; 18 = 16 + 2 -> shift de 1 + shift de 4
	mov eax, 2
	mov ebx, eax
	shl eax, 1
	shl ebx, 4
	add eax, ebx
	invoke printf, offset resultado, eax
	;invoke_getch
	invoke ExitProcess, 0
main ENDP
end