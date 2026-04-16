%macro START 0
	OPEN file
	MY_PRINT quine
	ret
%endmacro

%macro OPEN 1
	mov rax, 2
	mov rdi, %1
	mov rsi, 0x242
	mov rdx, 0644
	syscall
	cmp rax, 0
	jl error
	mov rdi, rax 
%endmacro

%macro MY_PRINT 1
	mov rsi, %1
	mov rdx, 34 
	mov rcx, %1
	mov r8, 10
	mov r9, 37
	xor rax, rax
	sub rsp, 8
	call dprintf
	add rsp, 8
	mov rax, 0
%endmacro

section .data
quine db "%4$cmacro START 0 %3$c	my_print quine%3$c	ret%3$c%4$cendmacro%3$c%3$c%4$cmacro INIT 0%3$c	xor rax, rax%3$c%4$cendmacro%3$c%3$c%4$cmacro MY_PRINT 1%3$c	mov rdi, %1 %3$c	mov rsi, 34%3$c	mov rdx, %1 %3$c	mov rcx, 10%3$c	mov r8, 37%3$c	xor rax, rax%3$c	call printf%3$c	mov rax, 0%3$c%4$cendmacro%3$c%3$csection .data%3$cquine db %1$c%2$s%1$c%3$c; Commentaire%3$c%3$csection .text%3$cglobal main%3$cextern printf%3$c%3$cmain:%3$c	START"

file db "grace_kid.asm", 0

; Commentaire

section .text
global main
extern dprintf

main:
	START

error:
	ret