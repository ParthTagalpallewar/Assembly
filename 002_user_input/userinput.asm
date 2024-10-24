;Program to take input from user

global _start

section .data

    nametitle: db 'Enter Your Name: '
    nametitlelen: equ $-nametitle

section .bss

    name: resb 100

section .text

_start:
    ;printing Enter your name
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, nametitle
    mov rdx, nametitlelen
    syscall

    ;Reading User name
    mov rax, 0x0
    mov rdi, 0x0
    mov rsi, name
    mov rdx, 100
    syscall
    mov rbx, rax ; storing number of bytes read 

    ;Printing user input
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, name
    mov rdx, rbx
    syscall

    ;Exit 
    mov rax, 60
    syscall