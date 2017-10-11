include mpcp.inc

.data
seq1 WORD 1,2,3,4,5,6,7,8,9,10
seq2 WORD 11,12,13,14,15,16,17,18,19,20
msg BYTE "SOMA = %d", 13, 10, 0

.code
main PROC C
	mov esi, offset seq1
	mov edi, offset seq2
	mov BX, LENGTHOF seq1
	mov DX, LENGTHOF seq2
	xor AX, AX ; somador

CICLO:	add AX, [esi]
	jo OVERFLOW1
	add AX, [edi]
	jo OVERFLOW2
	add esi, 2
	add edi, 2
	loop CICLO
	jmp FIM

	;; havendo overflow, se ultimo valor de [edi]
	;; e se for positivo entao apresentar
	;; o valor maximo positivo (0FFFH)
	;; caso contrario apresentar (F000H)

OVERFLOW1:	mov AX, [esi]
		cmp AX, 0
		js NEGATIVO1
		mov AX, 0FFFH
		jmp FIM
NEGATIVO1:	mov AX, 0F000H
		jmp FIM
OVERFLOW2:	mov AX, [edi]
		cmp AX, 0
		js NEGATIVO2
		mov AX, 0FFFH
		jmp FIM
NEGATIVO2:	mov AX, 0F000H

FIM:		invoke printf, offset msg, AX
		;invoke_getch
		invoke ExitProcess, 0
main ENDP
end
