NAME = Grace
CFLAGS = -Wall -Wextra -Werror

all : $(NAME)

$(NAME) :
	gcc  $(CFLAGS) Grace.c -o $(NAME)

clean :
	rm Grace.o

fclean : clean
	rm $(NAME)
	rm Grace_kid.c

re : fclean all