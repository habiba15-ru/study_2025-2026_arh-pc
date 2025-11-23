%include 'in_out.asm'

section .data
msg_x db 'Введите x: ',0h
msg_a db 'Введите a: ',0h  
msg_result db "Результат f(x): ",0h

section .bss
x resb 10
a resb 10
result resb 4

section .text
global _start
_start:
    
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov esi, x
    call remove_newline
    mov eax, x
    call atoi
    mov [x], eax

     
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov esi, a
    call remove_newline
    mov eax, a
    call atoi
    mov [a], eax

       
    mov eax, [x]
    mov ebx, [a]
    
    cmp eax, ebx        
    jl less_than       
    jmp greater_equal 

less_than:
    ; f(x) = 2a - x
    mov eax, [a]      ; eax = a
    mov ebx, 2        ; ebx = 2
    mul ebx           ; eax = 2 * a
    sub eax, [x]      ; eax = 2a - x
    jmp print_result

greater_equal:
    ; f(x) = 8
    mov eax, 8

print_result:
    mov [result], eax
    mov eax, msg_result
    call sprint
    mov eax, [result]
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
