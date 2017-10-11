include mpcp.inc
.XMM

.data
W dword 7
X real4 7.1
Y real8 ?
msg byte "Y = %f", 13, 10, 0

.code
main proc c
	cvtsi2ss xmm0, W
	movss xmm1, X
	sqrtss xmm1, xmm1
	addss xmm1, xmm0
	cvtss2sd xmm2, xmm1
	movsd Y, xmm2
	invoke printf, offset msg, Y
	invoke ExitProcess, 0
main endp
end