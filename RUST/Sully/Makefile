NAME = Sully

all : $(NAME)

$(NAME) :
	rustc Sully.rs -o $(NAME)

diff: all
	./$(NAME)
	diff Sully.rs Sully_0.rs

clean:
	rm Sully_*.rs || true

fclean : clean
	rm $(NAME)
	rm Sully_* || true

re : fclean all