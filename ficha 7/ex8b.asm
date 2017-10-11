include mpcp.inc
.XMM

cosseno PROTO x:REAL8, resultado:PTR REAL8
func PROTO graus:REAL8, resultado:PTR REAL8

.data
PI real8 3.1415926535897932
f1 real8 0.5
f2 real8 0.0416666667
f3 real8 0.0013888889
f4 real8 0.0000248016
f5 real8 0.0000002756
unidade real8 1.0
cosseno_result real8 ?
result real8 ?
radianos real8 ?
x_graus real8 45.0
msg byte "x_value = %f rad -> cos(%f) = %f", 13, 10, "y(%f) = 100 + 50*cos(%f) = %f", 13, 10, 0

.code
main proc c
	invoke func, x_graus, offset result
	invoke printf, offset msg, x_graus, x_graus, cosseno_result, cosseno_result, cosseno_result, result
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

func PROC graus:REAL8, resultado:PTR REAL8
	movsd xmm1, graus
	mulsd xmm1, PI
	mov ebx, 180
	cvtsi2sd xmm2, ebx
	divsd xmm1, xmm2
	movsd radianos, xmm1
	invoke cosseno, radianos, offset cosseno_result
	movsd xmm0, cosseno_result
	mov eax, resultado

	mov ebx, 50
	cvtsi2sd xmm1, ebx
	mulsd xmm0, xmm1
	mov ebx, 100
	cvtsi2sd xmm1, ebx
	addsd xmm0, xmm1
	
	movsd real8 ptr [eax], xmm0
	ret
func endp
end
