name = Colleen

flags = -O

all : $(NAME)

$(NAME) : Colleen.rs
	rustc $(FLAGS) Colleen.rs

run : $(NAME)
	./$(NAME)

diff : $(NAME)
	./$(NAME) > output.txt

clean :
	rm output.txt

fclean : clean
	rm $(NAME)

re : fclean all