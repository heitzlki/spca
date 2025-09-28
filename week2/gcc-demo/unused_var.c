#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
    int n1, n2, n3, n4;

    if (argc > 1) {
        n1 = atoi(argv[1]);
    }
    if (argc > 2) {
        n2 = atoi(argv[2]);
    }
    if (argc > 3) {
        n3 = atoi(argv[3]);
    }
    if (argc > 4) {
        n4 = atoi(argv[4]);
    }

    printf("Your numbers are: %d, %d, %d, %d\n", n1, n2, n3, n1);
}