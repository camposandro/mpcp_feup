include mpcp.inc

.data
seq_coefs SWORD 4,2,3
_x SWORD 2
msg BYTE "Valor do polinomio = %d", 13, 10, 0

.code
poly2 PROTO coefs: PTR SWORD, x: SWORD

main PROC C
	invoke poly2, offset seq_coefs, _x
	invoke printf, offset msg, eax
	invoke ExitProcess, 0
main ENDP

poly2 PROC coefs: PTR SWORD, x: SWORD
	xor eax, eax
	xor ebx, ebx
	mov esi, coefs

	mov ax, sword ptr [esi]
	mul x
	mul x
	add bx, ax

	add esi, 2
	mov ax, sword ptr [esi]
	mul x
	add bx, ax

	add esi, 2
	add bx, sword ptr [esi]
	
	mov ax, bx 
	ret
poly2 ENDP
END
