include mpcp.inc
.XMM

.data
a1 real8 0.278393
a2 real8 0.230389
a3 real8 0.000972
a4 real8 0.078108
_x real8 1.2
result real8 ?
msg byte "Result = %f", 13, 10, 0

.code
erfpos proc argX: real8, res: ptr real8
	mov eax, res
	movsd xmm0, argX

	mov ebx, 1
	cvtsi2sd xmm1, ebx
	movsd xmm2, argX
	mulsd xmm2, a1
	addsd xmm1, xmm2
	movsd xmm2, argX
	mulsd xmm2, xmm2
	mulsd xmm2, a2
	addsd xmm1, xmm2
	movsd xmm2, argX
	mov ecx, 3
@@: 	mulsd xmm2, xmm2	
	loop @B
	mulsd xmm2, a3
	addsd xmm1, xmm2
	movsd xmm2, argX
	mov ecx, 4
@@:	mulsd xmm2, xmm2
	loop @B
	mulsd xmm2, a4
	addsd xmm1, xmm2
	
	mov ecx, 4
@@: 	mulsd xmm1, xmm1
	loop @B

	cvtsi2sd xmm4, ebx
	divsd xmm3, xmm1
	subsd xmm4, xmm3
	movsd real8 ptr [eax], xmm4
	ret
erfpos endp

main proc c
	invoke erfpos, _x, offset result
	invoke printf, offset msg, result
	invoke ExitProcess, 0
main endp

end
