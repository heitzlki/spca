# GCC Flags Demo
These are three demo apps that demonstrate how the compiler can help catch bugs.

## Unused Variables
In `unused_var.c` there is a "copy-paste error" in the print statement.
First run
```
make unused_fail
```
to compile it without warnings turned on and see it fail silently.
Then run
```
make unused_safe
```
to compile it with `-Wall` and see how the compiler now warns you about the error.

### Buffer Overflow
In `strcpy_test.c` there is a potential buffer overflow when the name passed to the program is longer than 6 characters (including the null termination). For demo purposes `strcpy` is implemented in the file instead of using the one from the standard library. Run
```
make strcpy_ok
```
to see an execution that doesn't fail. Run
```
make strcpy_fail
```
to trigger the buffer overflow and see how the number on the stack gets corrupted.
Note that we compile with `-fno-stack-protector` to turn off `gcc`'s basic protector as well to make the memory corruption visible in this simple example.
Finally run
```
make strcpy_safe
```
to let `gcc` instrument the code to catch errors like that.
Note that this of course incurs a performance penalty and should not be used for production code.

## Signed-Unsigned Comparison
In `comparison.c` there is an implicit signed-unsigned integer comparison. This results in loop iterating untill 10; even though before the loop in the case number > 3, main function is returned.  
First run
```
make comparison_fail
```
to compile it without warnings turned on and see it fail silently.
Then run
```
make comparison_safe
```
to compile it with `-Wextra` and see how the compiler now warns you about the error.

You can then even run
```
make comparison_test_even_safer
```
to compile with `-Werror` to make compilation fail on warnings.

*Note:* To remove the executables, run
```
make clean
```