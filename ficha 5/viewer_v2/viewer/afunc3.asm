;; 1.c)

.686
.model flat, C

.data
constante byte 50

.code
afunc3 PROC pixels: ptr byte, largura: sdword, altura:sdword
	mov eax, largura
	mul altura
	jo fim
	mov ecx, eax

	mov edi, pixels
	.WHILE (ecx > 0)
		push ecx
		;; repete o processo para os 3 bytes de cor
		mov ecx, 3
		ciclo:	
			mov al, [edi]
			add al, constante
			jc _coloca255
			mov byte ptr [edi], al
			jmp _next
		_coloca255:
			mov byte ptr [edi], 255
		_next:
			inc edi
			loop ciclo
		inc edi
		pop ecx
		dec ecx
	.ENDW
fim:
	ret

afunc3 ENDP
END
