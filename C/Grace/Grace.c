/* Quine using define for auto-replication*/
#include <fcntl.h>
#include <stdio.h>

#define CODE "/* Quine using define for auto-replication*/%1$c#include <fcntl.h>%1$c#include <stdio.h>%1$c%1$c#define CODE %2$c%3$s%2$c%1$c#define MAIN int main(void){ int fd = open(%2$cGrace_kid.c%2$c, O_CREAT | O_WRONLY | O_TRUNC, 0644); dprintf(fd, CODE , 10, 34, CODE);}%1$c#define START MAIN%1$c%1$cSTART;"
#define MAIN int main(void){ int fd = open("Grace_kid.c", O_CREAT | O_WRONLY | O_TRUNC, 0644); dprintf(fd, CODE , 10, 34, CODE);}
#define START MAIN

START;