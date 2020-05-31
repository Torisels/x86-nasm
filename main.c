#include <stdio.h>

char* occurenceA(char *s);

int main(void)
{
    char text[]="ALA MA          KOTA~~~~~~~~~~~~~~~~~~~~";
    printf("Input string      > %s\n", text);
    char *result = occurenceA(text);
    printf("Conversion results> %s\n", result);

    return 0;
}





























//extern char* removerng(char *a, char start, char end);
//extern char* remnth(char *a, int n);
//extern char* leavelastndig(char *s, int n);