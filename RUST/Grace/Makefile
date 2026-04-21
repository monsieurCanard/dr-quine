name = Grace

flags = -O

all : $(NAME)

$(NAME) : Grace.rs
	rustc $(FLAGS) Grace.rs

run : $(NAME)
	./$(NAME)

diff : run
	diff Grace.rs Grace_kid.rs

clean :
	rm Grace_kid.rs

fclean : clean
	rm $(NAME)

re : fclean all