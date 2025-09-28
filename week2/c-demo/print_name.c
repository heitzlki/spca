#include <stdio.h>

int i = 79;

void print_name(void)
{
	const char s[] = "Mothy";
	printf("My name is %s and I work in CAB F %d\n", s, i);
	return;
}
