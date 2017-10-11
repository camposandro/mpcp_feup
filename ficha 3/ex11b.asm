include mpcp.inc

.data
seq DWORD 2,2,4
resultado BYTE "valor medio: %d",10,13,0
overflow BYTE "Ocorreu overflow, impossivel calcular media" ,10,13,0

.code
main PROC C

mov ecx, lengthof seq
mov esi, offset seq
xor eax, eax

next: 
	mov edx, [esi]
	add eax, edx
	jo erro
	add esi, 4
	loop next
	cdq
	mov ecx, lengthof seq
	div ecx
	shl edx,1
	cmp edx, ecx
	jng fim
	inc eax

fim: 
	invoke printf, offset resultado, eax
	jmp terminar

erro: 
	invoke printf, offset overflow

terminar: 
	invoke _getch
	invoke ExitProcess, 0

main ENDP
end