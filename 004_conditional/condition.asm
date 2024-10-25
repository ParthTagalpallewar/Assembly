global _start

section .bss

    user_key: resb 64

section .data

    access_granted_message: db "Access Granted!", 10
    access_granted_message_length: equ $-access_granted_message

    access_denied_message: db "Access Denied!", 10
    access_denied_message_length: equ $-access_denied_message

    original_key: db "11072003"
    original_key_length: equ $-original_key

section .text

_start:

   jmp main

main:
   
   mov rax, 0
   mov rdi, 0
   mov rsi, user_key
   mov rdx, 64
   syscall

cmp_key:

    ;compare length of input key and original key
    cmp rax, original_key_length
    jne access_denied

    mov rsi, original_key
    mov rdi, user_key

    mov rcx, original_key_length
    repe cmpsb

    je access_granted
    jne access_denied

access_granted:

    mov rax, 1
    mov rdi, 1
    mov rsi, access_granted_message
    mov rdx, access_granted_message_length
    syscall
    jmp exit

access_denied:

    mov rax, 1
    mov rdi, 1
    mov rsi, access_denied_message
    mov rdx, access_denied_message_length
    syscall
    jmp exit
 
exit:

    mov rax, 60
    mov rdi, 0
    syscall




;code execution
;suppose your binary file is contion
;echo -n 11072003 | ./condition