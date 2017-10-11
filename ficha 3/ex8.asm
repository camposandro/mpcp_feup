include mpcp.inc

.data
seq WORD 10, 5, 7, 3, 20
MAX WORD 0
MIN WORD 0
max BYTE "MAX = %d", 13, 10, 0
min BYTE "MIN = %d", 13, 10, 0

.code
main PROC C
	mov esi, offset seq
	mov ecx, lengthof seq
	mov AX, WORD PTR [esi]
	mov MAX, AX ;; no inicio max = min
	mov MIN, AX ;; correspondente ao 1o elem da seq

	dec ecx ; num de iteracoes = lengthof seq - 1 
CICLO:
	jecxz FIM
	add esi, 2
	mov AX, [esi]
	cmp AX, MAX ; compara com max
	ja NOVOMAX
	cmp AX, MIN ; compara com min
	jb NOVOMIN
	loop CICLO
	jmp FIM

NOVOMAX:
	dec ecx
	mov MAX, AX
	jmp CICLO

NOVOMIN:
	dec ecx
	mov MIN, AX
	jmp CICLO

FIM: 
	invoke printf, offset max, MAX
	invoke printf, offset min, MIN
	;invoke_getch
	invoke ExitProcess, 0

main ENDP
end