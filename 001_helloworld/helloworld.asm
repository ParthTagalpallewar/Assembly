;print hello world

global _start ; this tell program to start exectuion from start

section .data
    hello: db 'hello world'

section .text

_start:
    
    mov rax, 0x1 ;tell kernel to do (write) system call
    ;write system call takes 3 arguments 
    
    mov rdi, 0x1     ;first Argument (fd filedescriptor 0-> input, 1-> output, 2-> error)
    mov rsi, hello   ;second Argument (buffer)
    mov rdx, 0xb     ;third Argument (size of buffer)
    syscall 

    ;exit 
    mov rax, 60 ; 60 is exit system call need to set in rax register
    mov rdi, 0  ; first Argument is status code to be send in exit system call

    syscall




;Execution Steps

;1. convert asm file to object file >>>>>>>>  nasm elf64 helloworld.asm -o hello.o
;2. make hello.o as executable      >>>>>>>>  chmod +x hello.o
;3. link file                       >>>>>>>>  ld helloworld.o -o helloworld