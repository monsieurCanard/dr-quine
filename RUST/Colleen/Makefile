NAME = Colleen

FLAGS = -O

all : $(NAME)

$(NAME) : Colleen.rs
	rustc $(FLAGS) Colleen.rs

run : $(NAME)
	./$(NAME)

diff : all
	./$(NAME) > output.txt
	diff output.txt Colleen.rs

clean :
	rm output.txt || true

fclean : clean
	rm $(NAME)

re : fclean all