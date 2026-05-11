NAME = Grace
CFLAGS = -Wall -Wextra -Werror

.PHONY : all clean fclean re diff

all : $(NAME)

$(NAME) :
	gcc  $(CFLAGS) Grace.c -o $(NAME)

diff: all
	./$(NAME) > Grace_kid.c
	diff Grace_kid.c Grace.c

fclean :
	rm $(NAME)
	rm Grace_kid.c || true

re : fclean all