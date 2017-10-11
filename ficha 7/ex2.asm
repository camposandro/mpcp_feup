include mpcp.inc
.XMM

.data
A real4 1.2
B real4 2.2
_C real4 4.1
D real4 4.6
E real4 5.9
result real8 ?
msg byte "Resultado da expressao = %f", 13, 10, 0

.code
main proc c
	movss xmm0, A
	subss xmm0, B
	mulss xmm0, _C
	movss xmm1, D
	addss xmm1, A
	addss xmm1, E
	divss xmm0, xmm1
	cvtss2sd xmm0, xmm0
	movsd result, xmm0
	
	invoke printf, offset msg, result
	invoke ExitProcess, 0
main endp
end
