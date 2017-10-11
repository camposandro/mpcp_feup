include mpcp.inc
.XMM

interpol PROTO seqT: ptr real8, seqV: ptr real8, instT: real8, resY: ptr real8

.data
s_time real8 2.5,3.9,6.5
s_velocity real8 10.3,15.3,8.9 
instant_t real8 5.5
leftT_limit real8 ?
rightT_limit real8 ?
leftV_limit real8 ?
rightV_limit real8 ?
_return real8 ?
msg byte "Velocidade (t = %f): %f", 13, 10, 0

.code
main proc c
	invoke interpol, offset s_time, offset s_velocity, instant_t, offset _return
	invoke printf, offset msg, instant_t , _return
	invoke ExitProcess, 0
main endp

interpol PROC seqT: ptr real8, seqV: ptr real8, instT: real8, resY: ptr real8
	mov esi, seqT
	mov edi, seqV
	mov eax, resY

	mov ecx, lengthof s_time
	push ecx

	;; procura pela existencia de instT
@@:	movsd xmm0, real8 ptr [esi] ;; tempo
	comisd xmm0, instT
	je _returnSeqV
	add esi, 8
	add edi, 8
	loop @B

	pop ecx

	;; calcular extremos do valor
@@:	movsd xmm0, real8 ptr [esi] ;; tempo
	comisd xmm0, instT
	jb _left
	movsd rightT_limit, xmm0
	movsd xmm1, real8 ptr [edi]
	movsd rightV_limit, xmm1
	jmp _continua
_left:
	movsd leftT_limit, xmm0
	movsd xmm1, real8 ptr [edi]
	movsd leftV_limit, xmm1
_continua:
	add esi, 8
	add edi, 8
	loop @B

	;; calculo da interpolação linear
	movsd xmm0, rightV_limit
	subsd xmm0, leftV_limit
	movsd xmm1, rightT_limit
	subsd xmm1, leftT_limit
	divsd xmm0, xmm1
	movsd xmm1, instT
	subsd xmm1, leftT_limit
	mulsd xmm0, xmm1
	addsd xmm0, leftV_limit
	
	movsd real8 ptr [eax], xmm0
	jmp _ret

_returnSeqV:
	movsd xmm1, real8 ptr [edi] ;; velocidade
	movsd real8 ptr [eax], xmm1

_ret:
	ret
interpol endp

end