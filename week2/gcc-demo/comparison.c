#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv){
	int number;

	if(argc < 1){
		return -1;
	}

	number = atoi(argv[1]);

	if(number > 3){
		return -1;
	}

	for(unsigned i = 0; i < number; ++i){
		if(i > 10) break;	
		printf("%d\n", i);
	}

	return 0;
}
