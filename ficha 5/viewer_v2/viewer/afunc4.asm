;; 2.a)
.686
.model flat, C

.data

.code
afunc4 PROC pixels: ptr byte, largura: sdword, altura:sdword
	mov eax, largura
	mul altura
	jo fim
	mov ecx, eax
	mov edi, pixels

	;; alterar a cor do 1º pixel para vermelho
	mov byte ptr [edi], 0
	mov byte ptr [edi+1], 0
	mov byte ptr [edi+2], 255

	;; alterar a cor de um pixel na linha 50, coluna 70
	add edi, 100
	mov eax, 100
	shl eax, 2
	add edi, eax
	mov byte ptr [edi], 0
	mov byte ptr [edi+1], 0
	mov byte ptr [edi+2], 255
	mov byte ptr [edi+3], 255
fim:
	ret

afunc4 ENDP

END