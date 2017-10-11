include mpcp.inc

primo PROTO n: DWORD

.data
valor DWORD 10
msg BYTE "%d", 13, 10, 0

.code
main PROC C
	invoke primo, valor
	invoke printf, offset msg, eax
	invoke ExitProcess, 0
main endp

primo PROC USES ebx edi esi n: DWORD
	mov esi, n
	mov edi, n
	shr edi, 1

	mov ebx, 1
	mov ecx, 2
	
@@:	xor edx, edx
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
	
_ret:	mov eax, ebx
	ret
primo endp
end
