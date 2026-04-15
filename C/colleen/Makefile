NAME=colleen

all: $(NAME)


$(NAME):
	gcc -Wall -Wextra -Werror colleen.c -o $(NAME)

run: $(NAME)
	./$(NAME) > output

diff: $(NAME) 
	diff colleen.c output

clean:
	rm -rf *.o

fclean: clean
	rm colleen
	rm output