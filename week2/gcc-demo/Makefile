CC = gcc
CFLAGS = -Wall -g
CFLAGS_EXTRA = -Wall -Wextra -g
CFLAGS_EXTRA_SAFE = -Werror
CFLAGS_UNSAFE = $(CFLAGS) 				\
	-fno-stack-protector
CFLAGS_SAFE = $(CFLAGS) 				\
	-fsanitize=address 					\
    -fsanitize=undefined 				\
    -fstack-protector-all

.PHONY: unused_fail, unused_safe, strcpy_ok, strcpy_fail, strcpy_safe, \
comparison_fail, comparison_safe, clean

unused_test: unused_var.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) -g -o unused_test unused_var.c

unused_test_safe: unused_var.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) $(CFLAGS) -o unused_test_safe unused_var.c

strcpy_test: strcpy_test.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) $(CFLAGS_UNSAFE) -o strcpy_test strcpy_test.c
	@echo ""

strcpy_test_safe: strcpy_test.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) $(CFLAGS_SAFE) -o strcpy_test_safe strcpy_test.c
	@echo ""

comparison_test: comparison.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) -g -o comparison_test comparison.c	

comparison_test_safe: comparison.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) $(CFLAGS_EXTRA) -o comparison_test_safe comparison.c

comparison_test_even_safer: comparison.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) $(CFLAGS_EXTRA) $(CFLAGS_EXTRA_SAFE) -o comparison_test_even_safer comparison.c

unused_fail: unused_test
	@echo "************************"
	@echo "* Running programm...  *"
	@echo "************************"
	./unused_test 1 2 3 4

unused_safe: unused_test_safe
	@echo "************************"
	@echo "* Running programm...  *"
	@echo "************************"
	./unused_test 1 2 3 4

strcpy_ok: strcpy_test
	@echo "************************"
	@echo "* Running programm...  *"
	@echo "************************"
	./strcpy_test 42 Mothy

strcpy_fail: strcpy_test
	@echo "************************"
	@echo "* Running programm...  *"
	@echo "************************"
	./strcpy_test 42 Timothy

strcpy_safe: strcpy_test_safe
	@echo "************************"
	@echo "* Running programm...  *"
	@echo "************************"
	./strcpy_test_safe 42 Timothy

strcpy_preprocessor: strcpy_test.c
	@echo "**************************"
	@echo "* Preprocessor output... *"
	@echo "**************************"
	$(CC) -E strcpy_test.c | less

comparison_fail: comparison_test
	@echo "************************"
	@echo "* Running programm...  *"
	@echo "************************"
	./comparison_test "-1"

comparison_safe: comparison_test_safe
	@echo "************************"
	@echo "* Running programm...  *"
	@echo "************************"
	./comparison_test "-1"


clean:
	rm -f unused_test unused_test_safe strcpy_test strcpy_test_safe \
	comparison_test comparison_test_safe comparison_test_even_safer
