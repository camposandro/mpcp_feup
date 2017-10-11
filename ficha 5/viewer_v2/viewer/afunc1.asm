;; 1.a)

.686
.model flat, C

.data

.code
afunc1 PROC USES edi ebx pixels: ptr byte, largura: dword, altura:dword
	mov	eax,largura
	mul	altura		
	jc fim			
	mov	ecx, eax

	mov	edi, pixels
	.WHILE (ecx > 0)					
		mov byte ptr [edi], 0 ;; coloca-se blue a 0
		add edi, 4
		dec ecx
	.ENDW
fim:
	ret

afunc1 ENDP

END
