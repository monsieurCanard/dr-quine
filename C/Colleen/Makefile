NAME=Colleen

all: $(NAME)

$(NAME):
	gcc -Wall -Wextra -Werror Colleen.c -o $(NAME)

run: $(NAME)
	./$(NAME) > output.txt

diff: run
	diff Colleen.c output.txt

clean:
	rm -rf *.o

fclean: clean
	rm Colleen
	rm output.txt

re: fclean all