;; 1.b)

.686
.model flat, C

.code

afunc2 PROC pixels: ptr byte, largura: sdword, altura:sdword
	mov eax, largura
	mul altura
	jo fim
	mov ecx, eax

	mov edi, pixels
	.WHILE (ecx > 0)
		mov al, [edi]   ;; B
		mov bl, [edi+1] ;; G
		mov dl, [edi+2] ;; R
		mov byte ptr [edi], dl
		mov byte ptr [edi+1], al
		mov byte ptr [edi+2], bl
		add edi, 4
		dec ecx
	.ENDW
fim:
	ret

afunc2 ENDP
END
