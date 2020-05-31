#include <stdio.h>

char* occurenceB(char *s);

int main(void)
{
    char text[]="ALAXD MA KOTA KOTA KOTA KOTA";
    printf("Input string      > %s\n", text);
    char *result = occurenceB(text);
    printf("Conversion results> %s\n", result);

    return 0;
}





























//extern char* removerng(char *a, char start, char end);
//extern char* remnth(char *a, int n);
//extern char* leavelastndig(char *s, int n);