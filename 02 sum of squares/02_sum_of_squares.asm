section .data
Vec1 Times 200 dd 1
size dd 200
counter dd 0    
first dd 0  
second dd 0 

section .text
global CMAIN
CMAIN:
    mov eax, [size]
    mov ebx, 4
    mul ebx
    mov [counter], eax
    
    mov ecx, 0
    loop:
    
    mov eax, [Vec1+ecx] 
    mul eax
    
    mov ebx, [second] 
    add ebx, eax
    mov [second], ebx
    
    mov ebx, [first] 
    adc ebx, edx
    mov [first], ebx
 
    add ecx, 4 
    cmp ecx, [counter]
    jnz loop
    ret
