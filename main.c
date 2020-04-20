#include <stdio.h>

//usuwanie ostatniego ciągu cyfr dziesiętnych z łańcucha
//extern char* remlastnum(char *s);


//wczytanie pierwszej liczby dziesiętnej z łańcucha
unsigned int getdec(char *s, int *not_found);


int main(void)
{
    char text[]="123";
    printf("Input string      > %s\n", text);
    int not_found = 8;
    unsigned int result = getdec(text, &not_found);

    printf("Conversion results> %d\n", result);
    printf("Not found? :> %d\n", not_found);

    return 0;
}





























//extern char* removerng(char *a, char start, char end);
//extern char* remnth(char *a, int n);
//extern char* leavelastndig(char *s, int n);