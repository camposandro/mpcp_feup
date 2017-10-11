include mpcp.inc

.data
seq SWORD 1,2,8,-5,9
msg BYTE "Average = %d", 13, 10, 0
average SWORD 0

.code
avg PROTO seq_ptr: DWORD, nElem: DWORD

main PROC C
	invoke avg, offset seq, lengthof seq
	mov average, ax
	invoke printf, offset msg, average
	invoke ExitProcess, 0
main ENDP

avg PROC seq_ptr: DWORD, nElem: DWORD
	xor eax, eax
	mov esi, seq_ptr
	mov ecx, nElem
	
ciclo:
	add ax, sword ptr [esi]
	add esi, 2
	loop ciclo

	div nElem
	ret
avg ENDP

END