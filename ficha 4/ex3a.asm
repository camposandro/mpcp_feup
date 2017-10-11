include mpcp.inc

.data
seq SWORD 1,2,8,-10,5,-5
msg BYTE "MAX = %d", 13, 10, 0
max SWORD 0

.code
find_max PROTO seq_ptr: DWORD, nElem: DWORD

main PROC C
	invoke find_max, offset seq, lengthof seq
	mov max, ax
	invoke printf, offset msg, max
	invoke ExitProcess, 0
main ENDP

find_max PROC seq_ptr: DWORD, nElem: DWORD
	mov esi, seq_ptr
	mov ecx, nElem
	dec ecx

	mov ax, [esi]
	add esi, 2
ciclo:	cmp SWORD PTR [esi], ax
	jng next
	mov ax, [esi]
next:	add esi, 2 
	loop ciclo
	ret
find_max ENDP

END
