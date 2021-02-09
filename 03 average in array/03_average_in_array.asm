section .data
Vec1 Times 100 dd 0FFFFFFFh
size dd 100
counter dd 0

section .text
global CMAIN
CMAIN:
xor edx, edx

; Make counter
mov eax, [size]
mov ebx, 4
mul ebx
mov [counter], eax

; Summ
mov eax, 0
mov ecx, 0
mov edx, 0

loop:
add eax, [Vec1+ecx]
jnc next
inc edx
next:
add ecx, 4
cmp ecx, [counter]
jnz loop

; Division
mov ebx, [size]

div ebx
; the edx and eax registers contain bits of average value
ret