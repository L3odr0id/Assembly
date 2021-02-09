section .data
Vec1 dw 8, 45, 507, 228, 420, 345, 1337, 156, -255
Swap db 0
section .text
global CMAIN
CMAIN:
    mov ax, [Vec1]
    mov dx, 2
    mul dx
    mov [Vec1], ax

start:
    mov byte[Swap], 0
    mov ebx, 2

comparison:
    mov ax, [Vec1 + ebx]
    cmp ax, [Vec1 + ebx +2]
    jle noswap

    ;swapping
    mov dx, [Vec1 + ebx +2]
    mov [Vec1 + ebx +2], ax
    mov [Vec1 + ebx], dx
    mov byte[Swap], 1
noswap:
    add ebx, 2
    cmp bx, [Vec1]
    jnz comparison

    cmp byte[Swap], 0
    jnz start

    ; The array is sorted in ascending order
    ; The maximum array element is stored in [Vec1 + ebx] 
    ret