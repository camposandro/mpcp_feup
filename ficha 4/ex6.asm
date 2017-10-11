include mpcp.inc

.data
seq SWORD 1,2,8,-10,5,-5
msg BYTE "Seq. ordenada ...", 13, 10, 0
addr_min DWORD 0

.code
find_min PROTO seq_ptr: DWORD, nElem: DWORD
ordena PROTO seq_ptr: DWORD, nElem: DWORD

main PROC C
	invoke ordena, offset seq, lengthof seq
	invoke printf, offset msg
	invoke ExitProcess, 0
main ENDP

find_min PROC seq_ptr: DWORD, nElem: DWORD
	xor eax, eax
	mov esi, seq_ptr
	mov ecx, nElem
	dec ecx
	
	mov eax, esi 
	add esi, 2
ciclo:	mov dx, [eax]
	cmp SWORD PTR [esi], dx
	jg next
	mov eax, esi
next:	add esi, 2 
	loop ciclo

	mov addr_min, eax
	ret
find_min ENDP

ordena PROC seq_ptr: DWORD, nElem: DWORD
	mov edi, seq_ptr
	mov ecx, nElem

ciclo:	push edi
	push ecx
	invoke find_min, edi, ecx
	pop ecx
	pop edi
	xchg [addr_min], [edi]
	add edi, 2
	loop ciclo

	ret
ordena ENDP
END
