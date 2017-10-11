include mpcp.inc
.XMM

dist PROTO x:REAL8, y:REAL8, ptrD:PTR REAL8

.data
x_ponto real8 1.2
y_ponto real8 2.3
distancia real8 ?
msg byte "Distancia do ponto a origem: %f", 13, 10, 0

.code
main proc c
	invoke dist, x_ponto, y_ponto, offset distancia
	invoke printf, offset msg, distancia
	invoke ExitProcess, 0
main endp

dist PROC x:REAL8, y:REAL8, ptrD:PTR REAL8
	mov eax, ptrD
	movsd xmm0, x
	movsd xmm1, y
	mulsd xmm0, xmm0
	mulsd xmm1, xmm1
	addsd xmm0, xmm1
	sqrtsd xmm0, xmm0
	movsd distancia, xmm0
	ret 
dist endp
end
