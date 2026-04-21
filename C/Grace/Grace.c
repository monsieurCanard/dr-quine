/* Quine using define for auto-replication*/


#define CODE "/* Quine using define for auto-replication*/%c%c%c#define CODE %c%s%c%c#define MAIN int main(void){ int fd = open(%cgrace_kid.c%c, 0100 | 01 | 01000, 0644); dprintf(fd, CODE, 10, 10, 10, 34, CODE, 34, 10, 34, 34, 10, 10, 10);}%c#define START MAIN%c%cSTART;"
#define MAIN int main(void){ int fd = open("grace_kid.c", 0100 | 01 | 01000, 0644); dprintf(fd, CODE, 10, 10, 10, 34, CODE, 34, 10, 34, 34, 10, 10, 10);}
#define START MAIN

START;