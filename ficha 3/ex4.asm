include mpcp.inc

; ex a)
.data 
exp BYTE "%d", 13, 10, 0

.code
main PROC C
		 mov ebx, 3
		 mov ecx, 4

		 mov eax, -123
		 add eax, ebx
		 jo excesso
		 add eax, ecx
		 jo excesso
		 invoke printf, offset exp, eax
excesso: invoke ExitProcess, 0

main ENDP
end

; ex b)
.data 
exp BYTE "%d", 13, 10, 0

main PROC C
		  mov ebx, 3
		  mov ecx, 4
		  mov edx, 2 
		
		  mov eax, ebx
		  sub eax, ecx 
		  jo overflow
		  imul 4
		  jo overflow
		  sub eax, edx
		  jo overflow
		  invoke printf, offset exp, eax
overflow: invoke ExitProcess, 0

main ENDP
end

; ex c)
.data 
exp BYTE "%d", 13, 10, 0

.code
main PROC C
		 mov ebx, 3
		 mov ecx, 4
		 
		 mov eax, ebx
		 add eax, ecx
		 jo excesso
		 mov edx, 5
		 cbw
		 idiv edx
		 invoke printf, offset exp, eax
excesso: invoke ExitProcess, 0

main ENDP
end