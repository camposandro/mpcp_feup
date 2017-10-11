include mpcp.inc
.XMM

cosseno PROTO x:REAL8, resultado:PTR REAL8

.data
msg byte "Resultado = %f", 13, 10, 0
_x real8 1.5
result real8 ?
unidade real8 1.0
f1 real8 0.5
f2 real8 0.0416666667
f3 real8 0.0013888889
f4 real8 0.0000248016
f5 real8 0.0000002756

.code
main proc c
	invoke cosseno, _x, offset result
	invoke printf, offset msg, result
	invoke ExitProcess, 0
main endp

cosseno PROC x:REAL8, resultado:PTR REAL8
	mov eax, resultado
	movsd xmm0, x
	movsd xmm1, f1
	movsd xmm2, f2
	movsd xmm3, f3
	movsd xmm4, f4
	movsd xmm4, f5
	movsd xmm6, unidade

	mulsd xmm0, xmm0 ;; x^2
	mulsd xmm5, xmm0
	subsd xmm4, xmm5
	mulsd xmm4, xmm0
	subsd xmm3, xmm4
	mulsd xmm3, xmm0
	subsd xmm2, xmm3
	mulsd xmm2, xmm0
	subsd xmm1, xmm2
	mulsd xmm1, xmm0
	subsd xmm6, xmm1

	movsd real8 ptr [eax], xmm6
	ret
cosseno endp
end
