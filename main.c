#include <stdio.h>

//usuwanie ostatniego ciągu cyfr dziesiętnych z łańcucha
extern char* remlastnum(char *s);

int main(void)
{
    char text[]="abcabcabcaa12345678910";
    printf("Input string      > %s\n", text);

    char* result = remlastnum(text);

    printf("Conversion results> %s\n", result);

    return 0;
}





























//extern char* removerng(char *a, char start, char end);
//extern char* remnth(char *a, int n);
//extern char* leavelastndig(char *s, int n);