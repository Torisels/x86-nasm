#include <stdio.h>

char* start_cap(char *s);

int main(void)
{
    char text[]="a*abc**xdddd**a*0b*";
    printf("Input string      > %s\n", text);
    char *result = start_cap(text);
    printf("Conversion results> %s\n", result);

    return 0;
}





























//extern char* removerng(char *a, char start, char end);
//extern char* remnth(char *a, int n);
//extern char* leavelastndig(char *s, int n);