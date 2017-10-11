include mpcp.inc

.data
value DWORD 79
msg BYTE "Menor potencia de 2 maior que %d: %d", 13, 10, 0

.code
minPot2 PROTO val: DWORD

main PROC C
	invoke minPot2, value
	invoke printf, offset msg, value, eax
main ENDP

minPot2 PROC val: DWORD
	mov ecx, 1
	mov edx, 2
	mov eax, val
	
ciclo:
	cmp edx, eax
	jg _pot2
	shl edx, 1
	inc ecx
	jmp ciclo

_pot2:
	mov eax, 1
fim:
	shl eax, 1
	loop fim
	ret

minPot2 ENDP

END