#include <stdio.h>
#include <stdlib.h>

int in_int()
{
    long i;
    char* c = (char*)calloc(4096, 1);
    fgets(c, 4096, stdin);
    // Return 0 on bad input
    if (sscanf(c, "%ld", &i) != 1)
      return 0;
    if (i > 2147483647 || i < -2147483648)
      return 0;
    return i;
}

void out_int(int i)
{
    printf("%d", i);
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
    int i = in_int();
    out_int(i);
    //printf("\n");
    char* c = in_string();
    out_string(c);
    return 0;
}
