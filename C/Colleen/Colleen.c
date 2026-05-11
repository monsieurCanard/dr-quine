#include <stdio.h>

void	dummy_function(void) {
}
//Ceci est le commentaire en dehors de la fonction
int	main(void) {
char *self = "#include <stdio.h>%1$c%1$cvoid	dummy_function(void) {%1$c}%1$c%3$c%3$cCeci est le commentaire en dehors de la fonction%1$cint	main(void) {%1$cchar *self = %2$c%4$s%2$c;%1$c	printf(self, 10, 34, 47, self);%1$c%3$c%3$cCeci est le commentaire dans la fonction%1$cdummy_function();%1$c}";
	printf(self, 10, 34, 47, self);
//Ceci est le commentaire dans la fonction
dummy_function();
}