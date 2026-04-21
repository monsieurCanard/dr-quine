section .data
quine db "section .data%3$cquine db %1$c%2$s%1$c%3$csection .text%3$cglobal main%3$cextern printf%3$c%3$cmy_print:%3$c    xor rax, rax%3$c    call printf%3$c    ret%3$c%3$c;Commentaire ouside of the entrypoint routine%3$cmain:%3$c    ;printf init and call%3$c    mov rdi, quine%3$c    mov rsi, 34%3$c    mov rdx, quine%3$c    mov rcx, 10%3$c    call my_print%3$c    mov rax, 0 %3$c    ret%3$c"
section .text
global main
extern printf

my_print:
    xor rax, rax
    call printf
    ret

;Commentaire ouside of the entrypoint routine
main:
    ;printf init and call
    mov rdi, quine
    mov rsi, 34
    mov rdx, quine
    mov rcx, 10
    call my_print
    mov rax, 0
    ret
