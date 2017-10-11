include mpcp.inc

.data
seq SWORD 1,2,8,-10,5,-5
msg BYTE "MIN = %d", 13, 10, 0
min SWORD 0

.code
find_min PROTO seq_ptr: DWORD, nElem: DWORD

main PROC C
	invoke find_min, offset seq, lengthof seq
	mov min, ax
	invoke printf, offset msg, min
	invoke ExitProcess, 0
main ENDP

find_min PROC seq_ptr: DWORD, nElem: DWORD
	mov esi, seq_ptr
	mov ecx, nElem
	dec ecx
	
	mov ax, [esi] 
	add esi, 2
ciclo:	cmp SWORD PTR [esi], ax
	jg next
	mov ax, [esi]
next:	add esi, 2 
	loop ciclo
	ret
find_min ENDP
END
