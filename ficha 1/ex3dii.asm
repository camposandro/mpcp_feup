include mpcp.inc

.data
msg BYTE "%d", 13, 10, 0
seq DWORD 1,0,1,1,0

.code
main PROC C
	; valor teste para eax
	mov ecx, 1011010110b

	xor edx, edx ; contador global
	mov edi, 5 ; contador secundario - termina seq?
	mov esi, offset seq
ciclo:
	jecxz fim
	cmp edi, 0
	je restart
	shl ecx, 1 ; obter msb do valor
	pushfd ; guarda eflags
	pop ebx ; 
	BT eax, 0 ; msb do valor em EAX
	cmp eax, [esi]
	jne avanca
	inc esi
	dec edi
	jmp ciclo
restart:
	mov esi, offset seq
avanca:
	dec edi
	jmp ciclo
fim:
	invoke printf, offset msg, edx
	invoke _getch
	invoke	ExitProcess, 0
	
main ENDP
end 