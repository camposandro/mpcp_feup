include mpcp.inc

func1 PROTO vect : ptr byte , nelem : dword
func2 PROTO arg1 : dword

.data
val byte 13, 21, 12, 20
outmsg byte "%d", 13, 10, 0

.code
main proc c
	call rotina
	invoke _getch
	invoke ExitProcess, 0

rotina proc
	invoke func1 , offset val , lengthof val
	invoke printf , offset outmsg , eax
	ret
rotina endp

func1 proc uses ebx esi vect : ptr byte , nelem : dword
	mov ecx, nelem
	mov esi, vect
	mov ebx, 0
ciclo:
	movsx edx, byte ptr [esi]
	push ecx
	invoke func2, edx
	pop ecx 
	add ebx, eax
	inc esi
	loop ciclo
fim:
	mov eax, ebx
	ret
func1 endp

func2 proc arg1 : dword
	mov eax, 1
	and eax, arg1
	jz @F
	mov eax, 0
	jmp fim
@@:
	mov eax, arg1
fim:
	ret
func2 endp

main endp
END