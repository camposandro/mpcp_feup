include mpcp.inc

.data
seq DWORD 10,20,40,5,15,1,8,2,9,3
msg BYTE "valor medio: %d",10,13,0

.code
main PROC C
	mov ecx, lengthof seq
	mov esi, offset seq
	xor eax, eax

next: 	mov edx, [esi]
	add eax, edx
	add esi, 4
	loop next
	cdq
	mov ecx, lengthof seq
	div ecx
	shl edx,1 
	cmp edx, ecx
	jng fim
	inc eax

fim: 	invoke printf, offset msg, eax
	invoke _getch
	invoke	ExitProcess, 0
main ENDP
end
