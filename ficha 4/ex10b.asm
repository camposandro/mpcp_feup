include mpcp.inc

isprime PROTO n: DWORD

.data
Vect DWORD 1,2,3,4,5
msg BYTE "MAX = %d, MIN = %d", 13, 10, 0

.code
main PROC C
	mov ebx, 0FFFFFFFFh ; ebx == 1 -> menor primo provisorio
	xor edx, edx ; edx == 0, provisoriamente -> maior primo a ser calculado
	mov esi, offset Vect
	mov ecx, lengthof Vect

_loop:
	jecxz fim
	mov edi, dword ptr [esi]
	push ecx
	push edx
	invoke isprime, edi
	pop edx
	pop ecx
	cmp eax, 1
	jne next 
	cmp edi, ebx
	jae @F ; superior ou igual ao menor primo ? -> testar para maior
	mov ebx, edi ; senao menor primo = edi

@@:
	cmp edi, edx 
	jbe next ; menor ou igual que maior primo ? -> proximo
	mov edx, edi ; senao maior primo = edi

next:
	add esi, 4
	dec ecx
	jmp _loop

fim: 
	invoke printf, offset msg, ebx, edx ; ebx == menor primo e edx == maior primo
main endp

isprime PROC USES ebx edi esi n: DWORD
	mov esi, n
	mov edi, n
	shr edi, 1

	mov ebx, 1
	mov ecx, 2
@@:
	xor edx, edx
	mov eax, esi
	div ecx
	cmp edx, 0
	je nao_primo
	cmp ecx, edi
	jae _ret
	inc ecx
	jmp @B
nao_primo:
	mov ebx, 0
_ret:
	mov eax, ebx
	ret
isprime endp

end