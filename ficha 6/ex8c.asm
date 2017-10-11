include mpcp.inc

.data

texto byte "The first ray of light which illumines the gloom, and converts into", 13, 10, 0

vector dword 256 DUP (0)

msg byte "Num_ocorrencia de minusculas: "

.code
hist proc USES esi edi cadeia: ptr byte, vetor: ptr dword
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

linha_cardinais proc USES edi nchar: dword
	mov edi, offset msg
	mov ecx, nchar
	mov eax, '#'
	cld
	rep stosb 
	ret
linha_cardinais endp

main proc c
	invoke hist, offset texto, offset vector

	xor eax, eax ;somador para num_ocorr
	mov esi, offset vector

	;; as minusculas têm ascii entre 97 e 122
	mov edi, vector[97]
	mov ecx, 26
@@: add eax, [edi]
	add edi, 4
	loop @B
	
	invoke linha_cardinais, eax
	invoke ExitProcess, 0
main endp

end