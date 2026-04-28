NAME = Sully

all : $(NAME)

$(NAME) :
	rustc Sully.rs -o $(NAME)

clean:
	rm Sully_*.rs

fclean : clean
	rm $(NAME)
	rm Sully_*

re : fclean all