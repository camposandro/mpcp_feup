include mpcp.inc

maxnum PROTO seq: ptr dword, n: dword

.data
sequence dword 1,6,100,58,76
msg BYTE "MAX SEQ = %d", 13, 10, 0

.code
main PROC C
	invoke maxnum, offset sequence, lengthof sequence
	invoke printf, offset msg, eax
	invoke ExitProcess, 0
main endp

maxnum PROC seq: ptr dword, n: dword
	mov ecx, n
	dec ecx
	mov esi, seq
	
	mov eax, [esi]
_loop:
	add esi, 4
	cmp [esi], eax
	jbe _next
	mov eax, [esi]
_next:
	loop _loop
	ret
maxnum endp

end


;; aquando da invocacao "invoke maxnum, offset sequence, lengthof sequence"
;; e com sequence = {4,8,11,2,9,7} o estado da pilha é o apresentado a seguir:
;; -> lengthof sequence (6)
;; -> offset sequence
;; -> endereço de retorno para main
;; -> EBP