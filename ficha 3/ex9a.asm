include mpcp.inc

.data
msg BYTE "ECX = %d", 13, 10, 0

.code
main PROC C
	xor ecx, ecx ; inicializa ecx
	
	;; valores para teste
	mov AH, 5
	mov CL, 4
	mov BL, 7
	mov BH, 4
	mov AL, 2
	;; ------------------

	cmp AH, CL
	jb TRUE
	cmp BL, BH
	jbe FIM
	cmp AL, AH
	jbe FIM

TRUE: 	inc ecx
	jmp FIM

FIM:  	;; fim == false
	invoke printf, offset msg, ecx
	; invoke_getch
	invoke ExitProcess, 0
main ENDP
end
