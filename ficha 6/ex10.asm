include mpcp.inc

detect_max proto conjunto: ptr byte, texto: ptr byte

.data
string byte "alma minha gentil, que te partiste", 0
vogais byte "aeiou", 0
msg byte "Caracter mais frequente: %c", 13, 10, 0

.code
main proc c
	invoke detect_max, offset vogais, offset string
	invoke printf, offset msg, eax
	invoke ExitProcess, 0
main endp

detect_max proc conjunto: ptr byte, texto: ptr byte
	mov esi, conjunto
	xor eax, eax
	xor dh, dh ;; guarda maximo atual

	.WHILE (byte ptr [esi] != 0)
	xor bl, bl
	mov edi, texto
	.WHILE (byte ptr [edi] != 0)
	mov dl, [edi]
	.IF (dl == byte ptr [esi])
	inc bl
	.ENDIF
	inc edi
	.ENDW
	.IF (bl >= dh)
	mov dh, bl
	movzx eax, byte ptr [esi]
	.ENDIF
	inc esi
	.ENDW
	ret
detect_max endp
end
