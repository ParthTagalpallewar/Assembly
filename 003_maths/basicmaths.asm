global _start

section .text

_start:

    mov rax, 2
    mov rbx, 4
    mov rax, rbx

    mov rax, 60
    syscall