%include "util.asm"

global _start

section .data

    message: db "Enter Number: ", 10, 0

section .bss

    user_value: resb 8

section .text

_start:

    mov rdi, message
    call printstr

    call readint
    mov [user_value], rax ;store rax value at location user_value is pointing to....

    mov rcx, [user_value]
    mov rbx, 1

Loop:
        mov rcx, [user_value]
        imul rcx, rbx
        mov rdi, rcx
        call printint
        call endl
        add rbx, 1
        cmp rbx, 11
        jne Loop
        call exit0