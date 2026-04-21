NAME=Grace

all: $(NAME)

$(NAME): Grace.o
	gcc -Wall -Wextra -Werror -no-pie -o $(NAME) Grace.o

Grace.o: Grace.asm
	nasm -f elf64 Grace.asm

run: $(NAME)
	./$(NAME)

diff: run
	diff Grace.asm Grace_kid.asm

clean:
	rm -rf *.o

fclean: clean
	rm -r Grace
	rm Grace_kid.asm

re: fclean all