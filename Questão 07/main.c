/* main.c simple program to test assembler program */

#include <stdio.h>

extern char test(char* a, char* b);

int main(void){

	char a[] = "GOTICO";
	char b[] = "ABACAA";
	char r = test(a,b);
	printf("O resultado é %c\n",r);
    return 0;
}
