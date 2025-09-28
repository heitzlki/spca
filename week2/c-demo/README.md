# C Demo
These are two ways to compile the same binary, once splitting up the code and once in one file.
These are in accordance with the exercise_slide.

## Splitting the code-base 
There are three different show examples:

### Everything in one file
First one, where we get a warning by the compiler, as the declaration of the function is too late. 
```
make one_warn
```
To run one where the function declaration is done at the top in the same file.
```
make one_ok
```

### Split up into two files
Here split the function into another file and we also use the header file for the function, as well as the preprocessor to only include once.
```
make split
```