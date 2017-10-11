include mpcp.inc

.data
seq byte 5,4,7,8,6,20h
msg byte "eax = %d", 13, 10, 0

.code
rot_b PROC USES edi vect : PTR BYTE , n: BYTE
	mov edi , vect
	mov al , 20h
	mov cl , n
	xor ebx , ebx
	movzx ecx , cl
@@: repnz scasb
	jnz @F
	inc ebx
	jmp @B
@@: mov eax , ebx
	ret
rot_b ENDP

main proc c
	invoke rot_b, offset seq, lengthof seq
	invoke printf, offset msg, eax
	invoke ExitProcess, 0
main endp

end