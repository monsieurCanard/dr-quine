NAME = Sully
CFLAGS = -Wall -Wextra -Werror

all : $(NAME)

$(NAME) :
	gcc $(CFLAGS) $(NAME).c -o $(NAME)

diff: all
	./$(NAME)
	diff Sully.c Sully_0.c

clean:
	rm *.o || true
	rm Sully_* || true

fclean : clean
	rm $(NAME)

re : fclean all