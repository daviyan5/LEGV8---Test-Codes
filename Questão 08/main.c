/* main.c simple program to test assembler program */

#include <stdio.h>
#include <string.h>
extern long long int test(char* a);

int main(void){

	char a[] = "213214";
	long long int r = test(a);
	printf("A soma para %s é %lld\n",a,r);
	strcpy(a,"999");
	r = test(a);
	printf("A soma para %s é %lld\n",a,r);
    return 0;
}
