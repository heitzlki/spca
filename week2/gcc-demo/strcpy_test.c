#include <stdlib.h>
#include <stdio.h>

#define BUF_SIZE 6

char *strcpy(char *dest, const char *src) {
    char *r = dest;
    while((*dest++ = *src++));
    return r;
}

int main(int argc, char **argv) {
    int number;
    char name[BUF_SIZE];

    if (argc > 1) {
        number = atoi(argv[1]);
    }
    else {
        number = 42;
    }

    if (argc > 2) {
        strcpy(name, argv[2]);
    }
    else {
        strcpy(name, "Mothy");
    }

    printf("I am %s, my favorite number is %d.\n", name, number);
    
    return 0;
}