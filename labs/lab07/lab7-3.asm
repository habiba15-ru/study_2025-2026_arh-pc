%include 'in_out.asm'

section .data
msg1 db 'Введите B: ',0h
msg2 db "Наименьшее число: ",0h
A dd 17
C dd 23

section .bss
min resb 4
B resb 10

section .text
global _start
_start:
    
    mov eax, msg1
    call sprint
    mov ecx, B
    mov edx, 10
    call sread

 
    mov esi, B
    call remove_newline

    mov eax, B
    call atoi
    mov [B], eax   
    mov ecx, [A]
    mov [min], ecx

    
    cmp ecx, [C]
    jl check_B
    mov ecx, [C]
    mov [min], ecx

check_B:
    
    mov ecx, [min]
    cmp ecx, [B]
    jl fin
    mov ecx, [B]
    mov [min], ecx

fin:
    
    mov eax, msg2
    call sprint
    mov eax, [min]
    call iprintLF
    call quit
remove_newline:
    mov edi, esi
.next_char:
    mov al, [edi]
    inc edi
    cmp al, 0
    je .done
    cmp al, 10
    jne .next_char
    dec edi
    mov byte [edi], 0
.done:
    ret
