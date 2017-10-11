include mpcp.inc

.data
seq byte 1,5,4,1,3,6,1
val byte 1
msg byte "eax = %d", 13, 10, 0

.code
ROT_X PROC USES EDI EBX AP1:ptr BYTE , Cval :BYTE , N: DWORD
	MOV AL , Cval
	MOV EDI , AP1
	MOV ECX , N
	CLD
	MOV EBX , 0
@@: 	REPNE SCASB ; compara o valor de al com [edi]
	JECXZ @F
	INC EBX
	JMP @B
@@: 	JNE @F
	INC EBX
@@: 	MOV EAX , EBX
	RET
ROT_X ENDP

main proc c
	invoke ROT_X, offset seq, val, lengthof seq
	invoke printf, offset msg, eax
	invoke ExitProcess, 0
main endp
end
