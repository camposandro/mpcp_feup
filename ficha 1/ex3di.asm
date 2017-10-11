include mpcp.inc

.data
msg BYTE "%d", 13, 10, 0

.code
main PROC C
	mov eax, 22
	xor ebx, ebx
	xor edx, edx
ciclo: 
	cmp eax, 0
	jz fim
	mov ebx, eax
	shr eax, 1
	and ebx, 11111b
	cmp ebx, 10110b
	jne ciclo
	inc edx
	jmp ciclo
fim: 
	invoke printf, offset msg, edx
	invoke _getch
	invoke	ExitProcess, 0
main ENDP
end 