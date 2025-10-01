#include <stdio.h>
#include <stdlib.h>

void test_array_of_pointers() {
    printf("=== TESTING ARRAY OF POINTERS ===\n");
    
    // Create 3 separate integers in different memory locations
    int a = 10, b = 20, c = 30;
    
    // Array of 3 pointers to integers
    int *arr_of_ptrs[3] = {&a, &b, &c};
    
    printf("Memory addresses:\n");
    printf("a: %p, b: %p, c: %p\n", (void*)&a, (void*)&b, (void*)&c);
    printf("arr_of_ptrs: %p\n", (void*)arr_of_ptrs);
    printf("arr_of_ptrs[0]: %p, arr_of_ptrs[1]: %p, arr_of_ptrs[2]: %p\n", 
           (void*)arr_of_ptrs[0], (void*)arr_of_ptrs[1], (void*)arr_of_ptrs[2]);
    
    printf("\nPointer arithmetic:\n");
    printf("arr_of_ptrs: %p\n", (void*)arr_of_ptrs);
    printf("arr_of_ptrs + 1: %p (difference: %ld bytes)\n", 
           (void*)(arr_of_ptrs + 1), 
           (char*)(arr_of_ptrs + 1) - (char*)arr_of_ptrs);
    
    printf("\nAccessing values:\n");
    for(int i = 0; i < 3; i++) {
        printf("arr_of_ptrs[%d] = %p, *arr_of_ptrs[%d] = %d\n", 
               i, (void*)arr_of_ptrs[i], i, *arr_of_ptrs[i]);
    }
    printf("\n");
}

void test_pointer_to_array() {
    printf("=== TESTING POINTER TO ARRAY ===\n");
    
    // Create an array of 3 integers (contiguous memory)
    int actual_array[3] = {100, 200, 300};
    
    // Pointer to an array of 3 integers
    int (*ptr_to_arr)[3] = &actual_array;
    
    printf("Memory addresses:\n");
    printf("actual_array: %p\n", (void*)actual_array);
    printf("ptr_to_arr: %p\n", (void*)ptr_to_arr);
    printf("&actual_array[0]: %p, &actual_array[1]: %p, &actual_array[2]: %p\n",
           (void*)&actual_array[0], (void*)&actual_array[1], (void*)&actual_array[2]);
    
    printf("\nPointer arithmetic:\n");
    printf("ptr_to_arr: %p\n", (void*)ptr_to_arr);
    printf("ptr_to_arr + 1: %p (difference: %ld bytes)\n",
           (void*)(ptr_to_arr + 1),
           (char*)(ptr_to_arr + 1) - (char*)ptr_to_arr);
    
    printf("\nAccessing values:\n");
    for(int i = 0; i < 3; i++) {
        printf("(*ptr_to_arr)[%d] = %d, &(*ptr_to_arr)[%d] = %p\n",
               i, (*ptr_to_arr)[i], i, (void*)&(*ptr_to_arr)[i]);
    }
    printf("\n");
}

void test_2d_array_scenario() {
    printf("=== TESTING 2D ARRAY SCENARIO ===\n");
    
    int matrix[2][3] = {{1, 2, 3}, {4, 5, 6}};
    
    // Array of pointers approach
    int *arr_of_ptrs[2];
    arr_of_ptrs[0] = matrix[0];  // points to first row
    arr_of_ptrs[1] = matrix[1];  // points to second row
    
    // Pointer to array approach  
    int (*ptr_to_arr)[3] = matrix;  // points to first row
    
    printf("Matrix memory layout:\n");
    printf("matrix[0]: %p, matrix[1]: %p\n", (void*)matrix[0], (void*)matrix[1]);
    printf("Difference between rows: %ld bytes\n", 
           (char*)matrix[1] - (char*)matrix[0]);
    
    printf("\nArray of pointers access:\n");
    for(int i = 0; i < 2; i++) {
        for(int j = 0; j < 3; j++) {
            printf("arr_of_ptrs[%d][%d] = %d ", i, j, arr_of_ptrs[i][j]);
        }
        printf("\n");
    }
    
    printf("\nPointer to array access:\n");
    for(int i = 0; i < 2; i++) {
        for(int j = 0; j < 3; j++) {
            printf("ptr_to_arr[%d][%d] = %d ", i, j, ptr_to_arr[i][j]);
        }
        printf("\n");
    }
    
    printf("\nPointer arithmetic comparison:\n");
    printf("arr_of_ptrs + 1: %p (moves by sizeof pointer)\n", (void*)(arr_of_ptrs + 1));
    printf("ptr_to_arr + 1: %p (moves by sizeof 3 ints)\n", (void*)(ptr_to_arr + 1));
    printf("\n");
}

void test_dynamic_allocation() {
    printf("=== TESTING DYNAMIC ALLOCATION ===\n");
    
    // Array of pointers with dynamic allocation
    int *dynamic_arr_of_ptrs[3];
    for(int i = 0; i < 3; i++) {
        dynamic_arr_of_ptrs[i] = malloc(sizeof(int));
        *dynamic_arr_of_ptrs[i] = i * 1000;
    }
    
    printf("Dynamically allocated pointers:\n");
    for(int i = 0; i < 3; i++) {
        printf("dynamic_arr_of_ptrs[%d] = %p, value = %d\n",
               i, (void*)dynamic_arr_of_ptrs[i], *dynamic_arr_of_ptrs[i]);
    }
    
    // Pointer to dynamically allocated array
    int (*dynamic_ptr_to_arr)[3] = malloc(sizeof(int[3]));
    (*dynamic_ptr_to_arr)[0] = 7000;
    (*dynamic_ptr_to_arr)[1] = 8000; 
    (*dynamic_ptr_to_arr)[2] = 9000;
    
    printf("\nDynamically allocated array:\n");
    printf("dynamic_ptr_to_arr = %p\n", (void*)dynamic_ptr_to_arr);
    for(int i = 0; i < 3; i++) {
        printf("(*dynamic_ptr_to_arr)[%d] = %d\n", i, (*dynamic_ptr_to_arr)[i]);
    }
    
    // Cleanup
    for(int i = 0; i < 3; i++) {
        free(dynamic_arr_of_ptrs[i]);
    }
    free(dynamic_ptr_to_arr);
}

int main() {
    test_array_of_pointers();
    test_pointer_to_array();
    test_2d_array_scenario();
    test_dynamic_allocation();
    
    return 0;
}