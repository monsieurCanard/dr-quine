NAME=grace

all: $(NAME)

$(NAME): grace.o
	gcc -Wall -Wextra -Werror -no-pie -o $(NAME) grace.o

grace.o: grace.asm
	nasm -f elf64 grace.asm

run: $(NAME)
	./$(NAME)
	cat grace_kid.asm

diff:
	diff grace.asm grace_kid.asm

clean:
	rm -rf *.o

fclean: clean
	rm -r grace
	rm grace_kid.asm
