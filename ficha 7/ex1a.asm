include mpcp.inc
.XMM

.data
B real4 7.8
M real4 3.6
N real4 7.1
P real8 ?
msg byte "P = %f", 13, 10, 0

.code
main proc c
	movss xmm0, N
	addss xmm0, B
	xorpd xmm1, xmm1
	subss xmm1, M
	mulss xmm1, xmm0
	cvtss2sd xmm2, xmm1
	movsd P, xmm2
	invoke printf, offset msg, P
	invoke ExitProcess, 0
main endp
end