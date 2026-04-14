section .data
    quine   db "section .data", 10
            db "    quine db %s", 0, 10

section .text
    global main
    extern printf

main:
    xor rax, rax
    mov rdi, quine
    mov rsi, quine
    call printf
    ret