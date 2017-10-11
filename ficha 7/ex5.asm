include mpcp.inc
.XMM

calc_poly_tab PROTO tab:PTR REAL8

.data
coefx3 real8 1.5
coefx real8 12.5
const dword 7
incremento real8 0.1

tabela real8 101 DUP (?)
imprimir real8 ?
msg byte "%f", 13, 10, 0

.code
main proc c
	invoke calc_poly_tab, offset tabela
	
	mov eax, offset tabela
	movsd xmm0, real8 ptr [eax]
	movsd imprimir, xmm0
	invoke printf, offset msg, imprimir

	invoke ExitProcess, 0
main endp

calc_poly_tab PROC tab:PTR REAL8
	movsd xmm1, coefx3
	movsd xmm2, coefx
	cvtsi2sd xmm3, const

	mov esi, tab
	xorpd xmm4, xmm4 ;;incrementa em 0.1 
	mov ecx, 101 ;;101 elementos

@@: 	xorpd xmm0, xmm0 ;;somador do poly

	;; monomio de x^3
	mulsd xmm1, xmm4
	mulsd xmm1, xmm4
	mulsd xmm1, xmm4
	;; monomio de x
	mulsd xmm2, xmm4
	;; valor do poly final
	addsd xmm0, xmm1
	subsd xmm0, xmm2
	addsd xmm0, xmm3
	
	movsd real8 ptr [esi], xmm0
	addsd xmm4, incremento
	add esi, type real8
	loop @B
	ret
calc_poly_tab endp
end
