include mpcp.inc

.data
texto byte "Uma cadeia de carateres", 0
vector dword 256 DUP (0)

.code
hist proc cadeia: ptr byte, vetor: ptr dword
	mov esi, cadeia
	mov edi, vetor
	mov edx, edi
	mov ecx, lengthof cadeia

	cld
@@:	lodsb
	movzx eax, al
	mov bx, [edx + eax]
	inc bx
	movzx ebx, bx
	stosd
	inc esi
	inc edi
	loop @B
	ret
hist endp

main proc c
	invoke hist, offset texto, offset vector
	invoke ExitProcess, 0
main endp
end
