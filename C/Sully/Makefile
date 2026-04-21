NAME = Sully
CFLAGS = Wall -Wextra -Werror

all : $(NAME)

$(NAME) :
	gcc $(CFLAGS) -o $(NAME)

clean:
	rm *.o

fclean : clean
	rm $(NAME)
	rm Sully_*

re : fclean all