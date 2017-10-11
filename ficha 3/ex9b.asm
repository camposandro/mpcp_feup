include mpcp.inc

.data
msg BYTE "ECX = %d", 13, 10, 0

.code
main PROC C
	xor ecx, ecx ; inicializa edx

	;; valores para teste
	mov AH, 3
	mov CL, 4
	mov BL, 7
	mov BH, 4
	mov AL, 7
	;; ------------------

	cmp AH, CL 
	jae FIM
	cmp BL, BH
	jg TRUE
	cmp AL, AH
	jae FIM

TRUE: 	dec ecx
	jmp FIM

FIM:	invoke printf, offset msg, ecx
	; invoke_getch
	invoke ExitProcess, 0
main ENDP
end
