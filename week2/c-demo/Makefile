CC = gcc
CFLAGS = -Wall -g
CFLAGS_UNSAFE = $(CFLAGS) 				\
	-fno-stack-protector
CFLAGS_SAFE = $(CFLAGS) 				\
	-fsanitize=address 					\
    -fsanitize=undefined 				\
    -fstack-protector-all

.PHONY: one_ok, one_warn, split, clean

one_ok: main.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) $(CFLAGS_SAFE) -o one main.c
	@echo "**************************"
	@echo "* Running it...		    *"
	@echo "**************************"
	./one
	@echo ""

one_warn: main_fail.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) $(CFLAGS_SAFE) -o one main_fail.c
	@echo "**************************"
	@echo "* Running it...		    *"
	@echo "**************************"
	./one
	@echo ""

split: split_main.c print_name.c
	@echo "*************************"
	@echo "* Compiling programm... *"
	@echo "*************************"
	$(CC) $(CFLAGS_SAFE) -o split split_main.c print_name.c
	@echo "**************************"
	@echo "* Running it...		    *"
	@echo "**************************"
	./split
	@echo ""

clean:
	rm -f split one