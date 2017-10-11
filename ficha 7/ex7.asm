include mpcp.inc
.XMM

.data
X real4 3 DUP (2.5)
Y real4 3 DUP (4.5)
result real4 ?
result_print real8 ?
msg byte "Resultado produto interno dos vetores = %f", 13, 10, 0

.code
prodint PROTO vectX:PTR REAL4, vectY:PTR REAL4, N:dword, res:PTR REAL4

main proc c
	invoke prodint, offset X, offset Y, 3, offset result
	cvtss2sd xmm0, result
	movsd result_print, xmm0
	invoke printf, offset msg, result_print
	invoke ExitProcess, 0
main endp

prodint PROC vectX:PTR REAL4, vectY:PTR REAL4, N:dword, res:PTR REAL4
	mov esi, vectX
	mov edi, vectY
	mov ecx, N
	mov eax, res

	xorps xmm2, xmm2 ;resultado
@@: movss xmm3, real4 ptr [esi]
	mulss xmm3, real4 ptr [edi]
	addss xmm2, xmm3
	add esi, 4
	add edi, 4
	loop @B
	movss real4 ptr [eax], xmm2
	ret
prodint endp

end