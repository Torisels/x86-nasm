#include <stdio.h>

char* kchars(char *s);

int main(void)
{
    char text[]="ALA 3MA KOTA";
    printf("Input string      > %s\n", text);
    char *result = kchars(text);
    printf("Conversion results> %s\n", result);

    return 0;
}





























//extern char* removerng(char *a, char start, char end);
//extern char* remnth(char *a, int n);
//extern char* leavelastndig(char *s, int n);