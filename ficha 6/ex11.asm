include mpcp.inc

num_frases proto buf: ptr byte
num_palavras proto buf: ptr byte, n: byte

.data
texto byte "Este e um texto exemplo.Obrigado pela leitura.Até mais.", 0
msg1 byte "Numero de frases = %d", 13, 10, 0
msg2 byte "Numero de palavras na frase %d = %d", 13, 10, 0
posfrase byte 2

.code
main proc c
	invoke num_frases, offset texto
	movzx ebx, posfrase

	.IF (ebx > eax)
		invoke printf, offset msg1, eax
		xor eax, eax ;; frase não existe
		invoke printf, offset msg2, posfrase, eax
	.ELSE
		invoke printf, offset msg1, eax
		invoke num_palavras, offset texto, posfrase
		invoke printf, offset msg2, posfrase, eax
	.ENDIF

	invoke ExitProcess, 0
main endp

num_frases proc buf: ptr byte
	mov esi, buf
	xor eax, eax
	
	.WHILE (byte ptr [esi] != 0)
		.IF (byte ptr [esi] == '.')
		inc eax
		.ENDIF
		inc esi
	.ENDW
	ret
num_frases endp

num_palavras proc buf: ptr byte, n: byte
	mov esi, buf
	movzx ebx, n
	dec ebx
	xor edx, edx ;; contador para posfrase

	.WHILE (edx < ebx)
	inc esi
		.IF (byte ptr [esi] == '.')
		inc edx
		.ENDIF
	.ENDW
	inc esi

	xor eax, eax ;; contador de palavras
	.WHILE (byte ptr [esi] != '.')
		.IF (byte ptr [esi] == ' ')
		inc eax
		.ENDIF
	inc esi
	.ENDW
	inc eax
	ret
num_palavras endp

end