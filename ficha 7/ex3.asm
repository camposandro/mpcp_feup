include mpcp.inc
.XMM

.data
PI real8 3.1415926535897932
raio real8 2.5
area real8 ?
msg byte "Area do circulo de raio %f = %f", 13, 10, 0

.code
main proc c
	movsd xmm0, raio
	mulsd xmm0, xmm0
	mulsd xmm0, PI
	movsd area, xmm0
	invoke printf, offset msg, raio, area
	invoke ExitProcess, 0
main endp
end