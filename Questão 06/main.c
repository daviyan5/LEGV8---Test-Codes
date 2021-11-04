/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(char* a);

int main(void){

	char a[] = "teste";
	long long int r = test(a);
	printf("A quantidade de vogais em %s e %lld\n",a,r);
    return 0;
}
