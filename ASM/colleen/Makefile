NAME=colleen

all: $(NAME)

$(NAME): colleen.o
	gcc -Wall -Wextra -Werror -no-pie -o $(NAME) colleen.o

colleen.o: colleen.asm
	nasm -f elf64 colleen.asm

run: $(NAME)
	./$(NAME) > output

diff:
	diff colleen.asm output

clean:
	rm -rf *.o

fclean: clean
	rm -r colleen
	rm output
