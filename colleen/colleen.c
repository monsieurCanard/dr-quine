#include <stdio.h>

void	dummy_function(void) {
}
//Ceci est le commentaire en dehors de la fonction
int	main(void) {
char *self = "#include <stdio.h>%c%cvoid	dummy_function(void) {%c}%c%c%cCeci est le commentaire en dehors de la fonction%cint	main(void) {%cchar *self = %c%s%c;%c	printf(self, 10, 10, 10, 10, 47, 47, 10, 10, 34, self, 34, 10, 10, 47, 47, 10, 10);%c%c%cCeci est le commentaire dans la fonction%cdummy_function();%c}";
	printf(self, 10, 10, 10, 10, 47, 47, 10, 10, 34, self, 34, 10, 10, 47, 47, 10, 10);
//Ceci est le commentaire dans la fonction
dummy_function();
}