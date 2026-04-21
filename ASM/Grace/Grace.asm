%macro START 0
	xor rax, rax
	section .data
		quine db "%%macro START 0%3$c	xor rax, rax%3$c	section .data%3$c		quine db %1$c%2$s%1$c, 0%3$c		file db %1$cgrace_kid.asm%1$c, 0%3$c%3$c	section .text%3$c		global main%3$c		extern dprintf%3$c		extern exit%3$c%3$c	main:%3$c		COPY%3$c	ret%3$c%%endmacro%3$c%3$c%%macro COPY 0%3$c	mov rax, 2%3$c	mov rdi, file%3$c	mov rsi, 0x242%3$c	mov rdx, 644q%3$c	syscall%3$c	cmp rax, rax%3$c	js exit%3$c	mov rdi, rax%3$c	MY_PRINT quine%3$c%%endmacro%3$c%3$c%4$c dprintf%3$c%%macro MY_PRINT 1%3$c	mov rsi, %%1%3$c	mov rdx, 34%3$c	mov rcx, %%1%3$c	mov r8, 10%3$c	mov r9, 59%3$c	xor rax, rax%3$c	sub rsp, 8%3$c	call dprintf%3$c	add rsp, 8%3$c	cmp rax, rax%3$c	js exit%3$c	mov rax, 0%3$c%%endmacro%3$c%3$cSTART", 0
		file db "grace_kid.asm", 0

	section .text
		global main
		extern dprintf
		extern exit

	main:
		COPY
	ret
%endmacro

%macro COPY 0
	mov rax, 2
	mov rdi, file
	mov rsi, 0x242
	mov rdx, 644q
	syscall
	cmp rax, rax
	js exit
	mov rdi, rax
	MY_PRINT quine
%endmacro

; dprintf
%macro MY_PRINT 1
	mov rsi, %1
	mov rdx, 34
	mov rcx, %1
	mov r8, 10
	mov r9, 59
	xor rax, rax
	sub rsp, 8
	call dprintf
	add rsp, 8
	cmp rax, rax
	js exit
	mov rax, 0
%endmacro

START