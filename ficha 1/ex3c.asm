include mpcp.inc

.data
msg BYTE "NUMBER OF EQUAL BITS IN THE SAME POSITION = %d", 13, 10, 0

.code
main PROC C
	mov ebx, 1 ;; valores a
	mov ecx, 2 ;; testar

	mov edx, 32 ; numero de bits dos numeros
	xor eax, eax ; contador de bits iguais em posicoes iguais

	;; para que os bits em posicoes correspondentes sejam os mesmos, um xor entre estes
	;; originara um valor em que o numero dos seus bits a zero correspondera ao numero
	;; de bits em comum para cada posicao

		xor ebx, ecx ;; agora testar para ebx
CICLO:	cmp edx, 0
		je FIM
		dec edx
		shr ebx, 1
		jc CICLO
		inc eax
		jmp CICLO
FIM:	invoke printf, offset msg, eax
		;invoke_getch
		invoke ExitProcess, 0
main ENDP

End