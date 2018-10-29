extern printf
extern scanf

section .data
    request: db "Enter an number",10,0
    format: db "%s",0
    num: dd 0
    formnum:db "%d",10,0
section .text
    global main

main:
    push ebp
    mov ebp,esp

    push request
    push format
    call printf

    push num
    push formnum
    call scanf

    mov ebx,1
   
;Printing the numer
	
	
	L1:
	mov edx,0
    mov eax,dword[num]
    mov ecx,ebx
    div ecx

    cmp edx,0
    je print


   	add ebx,1
   	cmp ebx,dword[num]
    jle L1

print:
	push ebx
	push formnum
	call printf
    cmp ebx,dword[num]
    je end

    add ebx,1
    jmp L1

end:
 leave
  ret
