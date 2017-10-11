include mpcp.inc

.data
buffer1 byte "FEUP - Engenharia Informatica e Computacao", 0
buffer2 byte "Engenharia", 0

.code
busca proc apt_bff1: ptr byte, apt_bff2: ptr byte
	mov esi, apt_bff2 ;; source
	mov edi, apt_buff1 ;; destination
	cld
	repne cmpsb
@@: mov ecx, lengthof buffer2
	

main proc c
	
main endp

end