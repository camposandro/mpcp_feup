;; 2.b)
.686
.model flat, C

.data
val3 dword 3

.code
afunc5 PROC pixels: ptr byte, largura: sdword, altura:sdword
	LOCAL valorMedioMax: dword, endPixelMax: dword
	mov edi, pixels

	mov ecx, altura
	.WHILE (ecx > 0)
		push ecx
		mov valorMedioMax, 0
		mov endPixelMax, 0
		mov ecx, largura
		.WHILE (ecx > 0)
			movzx eax, byte ptr [edi]
			movzx ebx, byte ptr [edi+1]
			movzx edx, byte ptr [edi+2]
			add eax, ebx
			add eax, edx
			div val3
			cmp eax, valorMedioMax
			ja _alteraMax
			jmp _next
		_alteraMax:
			mov valorMedioMax, eax
			mov endPixelMax, edi
		_next:
			add edi, 4
			dec ecx
		.ENDW
		mov dword ptr [endPixelMax], 0000FF00H
		pop ecx
		dec ecx
	.ENDW
	ret
afunc5 ENDP

END