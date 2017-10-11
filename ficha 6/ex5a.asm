include mpcp.inc

.data
text byte "Mantem nchars da Esq", 0
exit_code byte 13, 10, "%d (0 = SUCESSO)", 13, 10, 0

.code
esq proc nchar: dword
	;; para manter os da esquerda, deslocar
	;; o 0, que representa o fim da seq, para 
	;; o char no endereço offset texto+nchar
	 
	mov esi, offset text
	add esi, nchar
	mov dword ptr [esi], 0
	
	cmp byte ptr [esi], 0
	je return_0
	mov eax, 1
	jmp _end
return_0:
	mov eax, 0
_end:
	ret
esq endp

main proc c
	invoke esq, 3
	push eax
	invoke printf, offset text
	pop eax
	invoke printf, offset exit_code, eax
	invoke ExitProcess, 0
main endp

end