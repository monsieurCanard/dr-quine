%assign NUMBER 6
%assign NUMBER NUMBER - 1

%macro DUPLICATION 0
	mov rax, 2
	mov rdi, filename
	mov rsi, 0x242
	mov rdx, 644q
	syscall
	cmp rax, 0
	jl exit
	mov r13, rax
%endmacro

%macro MY_PRINT 2
	mov rdi, r13
	mov rsi, %1
	mov rdx, 34
	mov rcx, %1
	mov r8, 10
	mov r9, 59
	push %2
	sub rsp, 8
	xor rax, rax
	call dprintf
	add rsp, 16
%endmacro

section .data
	quine db "%%assign NUMBER %6$i%3$c%%assign NUMBER NUMBER - 1%3$c%3$c%%macro DUPLICATION 0%3$c	mov rax, 2%3$c	mov rdi, filename%3$c	mov rsi, 0x242%3$c	mov rdx, 644q%3$c	syscall%3$c	cmp rax, 0%3$c	jl exit%3$c	mov r13, rax%3$c%%endmacro%3$c%3$c%%macro MY_PRINT 2%3$c	mov rdi, r13%3$c	mov rsi, %%1%3$c	mov rdx, 34%3$c	mov rcx, %%1%3$c	mov r8, 10%3$c	mov r9, 59%3$c	push %%2%3$c	sub rsp, 8%3$c	xor rax, rax%3$c	call dprintf%3$c	add rsp, 16%3$c%%endmacro%3$c%3$csection .data%3$c	quine db %1$c%2$s%1$c, 0%3$c%3$c	filename_template db %1$cSully_%%i.asm%1$c, 0%3$c	exectuable_name_template db %1$cSully_%%i%1$c, 0%3$c	final_comp_exec_template db %1$cnasm -f elf64 Sully_%%i.asm && gcc -no-pie Sully_%%i.o -o Sully_%%i && ./Sully_%%i%1$c, 0%3$c%3$csection .bss%3$c	filename resb 64%3$c	executable_name resb 64%3$c	final_comp_exec resb 64%3$c%3$c%3$c%%macro COPY_INTO_BUFFER 2%3$c	mov rdi, %%1%3$c	mov rsi, %%2%3$c	mov rdx, r12%3$c	xor rax, rax%3$c	call sprintf%3$c%%endmacro%3$c%3$c%%macro MULTIPLE_COPY_INTO_BUFFER 2%3$c	mov rdi, %%1%3$c	mov rsi, %%2%3$c	mov rdx, r12%3$c	mov rcx, r12%3$c	mov r8, r12%3$c	mov r9, r12%3$c	xor rax, rax%3$c	call sprintf%3$c%%endmacro%3$c%3$csection .text%3$c	global main%3$c	extern dprintf%3$c	extern sprintf%3$c	extern system%3$c	extern exit%3$c	extern access%3$c%3$cmain:%3$c	push rbp%3$c	mov rbp, rsp%3$c	mov r12, NUMBER%3$c	cmp r12, 0%3$c	jl error%3$c	COPY_INTO_BUFFER filename, filename_template%3$c	mov rdi, filename%3$c	mov rsi, 0%3$c	call access%3$c	cmp eax, 0%3$c	je error%3$c%3$c	DUPLICATION%3$c%3$c	COPY_INTO_BUFFER executable_name, exectuable_name_template%3$c	MULTIPLE_COPY_INTO_BUFFER final_comp_exec, final_comp_exec_template%3$c	MY_PRINT quine, r12%3$c	mov rdi, final_comp_exec%3$c	call system%3$c	pop rbp%3$c	ret%3$c%3$cerror:%3$c	pop rbp%3$c	ret", 0

	filename_template db "Sully_%i.asm", 0
	exectuable_name_template db "Sully_%i", 0
	final_comp_exec_template db "nasm -f elf64 Sully_%i.asm && gcc -no-pie Sully_%i.o -o Sully_%i && ./Sully_%i", 0

section .bss
	filename resb 64
	executable_name resb 64
	final_comp_exec resb 64


%macro COPY_INTO_BUFFER 2
	mov rdi, %1
	mov rsi, %2
	mov rdx, r12
	xor rax, rax
	call sprintf
%endmacro

%macro MULTIPLE_COPY_INTO_BUFFER 2
	mov rdi, %1
	mov rsi, %2
	mov rdx, r12
	mov rcx, r12
	mov r8, r12
	mov r9, r12
	xor rax, rax
	call sprintf
%endmacro

section .text
	global main
	extern dprintf
	extern sprintf
	extern system
	extern exit
	extern access

main:
	push rbp
	mov rbp, rsp
	mov r12, NUMBER
	cmp r12, 0
	jl error
	COPY_INTO_BUFFER filename, filename_template
	mov rdi, filename
	mov rsi, 0
	call access
	cmp eax, 0
	je error

	DUPLICATION

	COPY_INTO_BUFFER executable_name, exectuable_name_template
	MULTIPLE_COPY_INTO_BUFFER final_comp_exec, final_comp_exec_template
	MY_PRINT quine, r12
	mov rdi, final_comp_exec
	call system
	pop rbp
	ret

error:
	pop rbp
	ret