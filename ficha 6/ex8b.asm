include mpcp.inc

.data
linha byte 256 DUP (0)

.code
linha_cardinais proc nchar: dword
	mov edi, offset linha
	mov ecx, nchar
	mov eax, '#'
	cld
	rep stosb 
	ret
linha_cardinais endp

main proc c
	invoke linha_cardinais, 100
	invoke printf, offset linha
	invoke ExitProcess, 0
main endp
end
