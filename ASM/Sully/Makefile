NAME = Sully
ASM_COMPIL = nasm -f elf64 Sully.asm
GCC = gcc -no-pie Sully.o -o Sully

all : $(NAME)

$(NAME) : Sully.o
	$(GCC)

Sully.o:
	$(ASM_COMPIL)

run: $(NAME)
	./$(NAME)

diff : run
	diff Sully.asm Sully_0.asm

clean :
	rm *.o

fclean : clean
	rm Sully_*
	rm Sully

re : fclean all