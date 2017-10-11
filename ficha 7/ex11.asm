include mpcp.inc
.XMM

conta_intervalo PROTO pt: ptr real4, n: dword, limA: real4, limB: real4

.data
seq real4 1.3,4.3,6.6,5.3,5.6
limiteA real4 3.2 
limiteB real4 5.5
msg byte "Numero de elementos pertencentes ao intervalo = %d", 13, 10, 0

.code
main proc c
	invoke conta_intervalo, offset seq, lengthof seq, limiteA, limiteB
	invoke printf, offset msg, eax
	invoke ExitProcess, 0
main endp

conta_intervalo PROC pt: ptr real4, n: dword, limA: real4, limB: real4
	xor eax, eax ;; somador
	mov esi, pt
	mov ecx, n

@@:	movss xmm0, real4 ptr [esi]
	comiss xmm0, limA
	jb _next
	comiss xmm0, limB
	ja _next
	inc eax
_next:
	add esi, 4
	loop @B
	ret
conta_intervalo endp

end
