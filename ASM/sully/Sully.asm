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
	mov rdx, 34  ; 1 = "
	mov rcx, %1  ; 2 = CODE
	mov r8, 10  ; 3 = \n
	mov r9, 59  ; 4 = 
	
	push %2  ; 5 = NUMBER
	sub rsp, 8
	xor rax, rax
	call dprintf
	add rsp, 16
%endmacro

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
	xor rax, rax
	call sprintf
%endmacro

section .data
	filename_template db "Sully_%i.asm", 0
	exectuable_name_template db "Sully_%i", 0
	final_comp_exec_template db "gcc Sully_%i.c -o Sully_%i && ./Sully_%i", 0
	
	quine db "%%assign NUMBER %5$i%3$c%%assign NUMBER NUMBER - 1%3$c%3$c%%macro DUPLICATION 0%3$c	mov rax, 2%3$c	mov rdi, filename%3$c	mov rsi, 0x242%3$c	mov rdx, 644q%3$c	syscall%3$c	comp rax, rax%3$c	js exit%3$c	mov rdi, rax%3$c	MY_PRINT quine NUMBER%3$c%%endmacro%3$c%3$c%%macro MY_PRINT 2%3$c	mov rsi, %%1%3$c	mov rdx, 34%3$c	mov r8, 10%3$c	mov r9, 59%3$c	push %%2%3$c	sub rsp, 8%3$c	xor rax, rax%3$c	sub rsp, 8%3$c	call dprintf%3$c	add rsp, 8%3$c	cnp rax, rax%3$c	js exit%3$c	mmov rax, 0%3$c%%endmacro%3$c%3$csection.data%3$c	quine db %1$c%2$c%1$c, 0%3$c%3$c	filename_template db %1$cSully_%%i.asm, 0%3$c	exectuable_name_template db %1$cSully_%%i%1$c, 0%3$c	final_comp_exec db %1$cgcc Sully_%%i.c -o Sully_%%i && ./Sully_%%i%1$c, 0%3$c%3$csection .bss%3$c	filename resb 64%3$c	executable_name resb 64%3$c	final_comp_exec resb 64%3$c%3$csection .text%3$c	global main%3$c	extern dprintf%3$c	extern sprintf%3$c	extern system%3$c	extern exit%3$c	extern access%3$c%3$c%%macro COPY_INTO_BUFFER 2%3$c	mov rdi, %%1%3$c	mov rsi, %%2%3$c	mov rdx, NUMBER%3$c	call sprintf%3$c%%endmacro%3$c%3$c%%macro MULTIPLE_COPY_INTO_BUFFER 1%3$c	mov rdi, %%1%3$c	mov rsi, NUMBER%3$c	mov rdx, NUMBER%3$c	mov rcx, NUMBER%3$c	call sprintf%3$c%%endmacro%3$c%3$cmain:%3$c	xor rax, rax%3$c	mov r12", 0

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