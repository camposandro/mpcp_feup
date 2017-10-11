include mpcp.inc

.data
texto byte "ConveRte pArA minUscUla", 13, 10, 0

.code
lcase proc buffer: ptr byte, nchars: byte
	movzx ecx, nchars
	sub ecx, 3
	mov esi, buffer
	mov edi, esi 
	
	cld
@@:	lodsb
	cmp al, 65
	jb next
	cmp al, 90
	ja next
	add al, 32
	stosb
	
next:	mov edi, esi
	loop @B 
	ret
lcase endp

main proc c
	invoke lcase, offset texto, lengthof texto
	invoke printf, offset texto
	invoke ExitProcess, 0
main endp
end
