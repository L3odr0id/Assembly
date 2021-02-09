section .data
MIN_32 dd -2147483648
tmp dd 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov ebx, 5
    mov edx, -1
    mov ecx, 2028
    call Max_even
    
    xor eax, eax
    ret
    
Max_even:
    mov eax, dword[MIN_32]
    
    cmp ebx, edx    
    jge check_ebx
    mov dword[tmp], edx
    AND edx, 01h
    jNZ check_ebx 
    
    mov eax, dword[tmp]
    jmp сomparison_2
        
   check_ebx:
    mov dword[tmp], ebx
    AND ebx, 01h
    jNZ check_edx 
    
    mov eax, dword[tmp]
    jmp comparison_2
    
    check_edx:
    mov dword[tmp], edx
    AND edx, 01h
    jNZ comparison_2     

    mov eax, dword[tmp]
    
    comparison_2: 
    cmp eax, ecx    
    jge me_end
    mov ebx, ecx
    AND ebx, 01h
    jNZ comparison_end 
    
    mov eax, ecx
    
    comparison_end: 
    ret