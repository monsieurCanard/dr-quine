#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#define CODE "#include <stdio.h>%1$c#include <unistd.h>%1$c#include <stdlib.h>%1$c%1$c#define CODE %2$c%4$s%2$c%1$c%1$c#define NUMBER %3$d%1$c%1$cint main(void){%1$c	if (NUMBER < 0)%1$c		return EXIT_SUCCESS;%1$c%1$c	char filename[20];%1$c%1$c	sprintf(filename, %2$cSully_%%i.c%2$c, NUMBER);%1$c	int ret = access(filename, F_OK);%1$c	if (!ret)%1$c		return EXIT_FAILURE;%1$c%1$c	int fd = open(filename, 0100 | 01 | 01000, 0644);%1$c	if (!fd)%1$c		return EXIT_FAILURE;%1$c	dprintf(fd, CODE, 10, 34, NUMBER - 1, CODE);%1$c%1$c	char compil_exec_line[100];%1$c	sprintf(compil_exec_line, %2$cgcc Sully_%%i.c -o Sully_%%i && ./Sully_%%i%2$c, NUMBER, NUMBER, NUMBER);%1$c	return system(compil_exec_line);%1$c}"

#define NUMBER 6

int main(void){
	if (NUMBER < 0)
		return EXIT_SUCCESS;

	char filename[20];

	sprintf(filename, "Sully_%i.c", NUMBER);
	int ret = access(filename, F_OK);
	if (!ret)
		return EXIT_FAILURE;

	int fd = open(filename, 0100 | 01 | 01000, 0644);
	if (!fd)
		return EXIT_FAILURE;
	dprintf(fd, CODE, 10, 34, NUMBER - 1, CODE);

	char compil_exec_line[100];
	sprintf(compil_exec_line, "gcc Sully_%i.c -o Sully_%i && ./Sully_%i", NUMBER, NUMBER, NUMBER);
	return system(compil_exec_line);
}