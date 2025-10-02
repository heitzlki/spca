#include <stdio.h>
#include <stdlib.h>

int factorial(int n) {
    if (n <= 1)
        return 1;
    return n * factorial(n - 1);
}

int main() {
    int x = 5;
    int result = factorial(x);
    printf("Factorial of %d is %d\n", x, result);
    
    int arr[3] = {10, 20, 30};
    int sum = 0;
    
    for (int i = 0; i < 3; i++) {
        sum += arr[i];
    }
    
    printf("Sum: %d\n", sum);
    return 0;
}