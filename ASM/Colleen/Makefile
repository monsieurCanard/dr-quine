NAME=Colleen

all: $(NAME)

$(NAME): Colleen.o
	gcc -Wall -Wextra -Werror -no-pie -o $(NAME) Colleen.o

Colleen.o: Colleen.asm
	nasm -f elf64 Colleen.asm

run: $(NAME)
	./$(NAME) > output.txt

diff: run
	diff Colleen.asm output.txt

clean:
	rm -rf *.o

fclean: clean
	rm -r Colleen
	rm output.txt

re: fclean all