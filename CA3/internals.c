#include <stdio.h>
#include <stdlib.h>

long in_int()
{
    long i;
    scanf("%ld", &i);
    return i; 
}

void out_int(long i)
{
    printf("%ld", i);
}

char* in_string()
{
    char* c = (char*)calloc(4096, 1);
    fgets(c, 4096, stdin);
    return c;
}

void out_string(char* c)
{
    printf("%s", c);
}

int main(int argc, char** argv)
{
    //long i = in_int();
    //out_int(i);
    //printf("\n");
    char* c = in_string();
    out_string(c);
    return 0;
}


