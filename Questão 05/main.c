/* main.c simple program to test assembler program */

#include <stdio.h>

extern void test(long long int a);

int main(void){

	long long int a = 13;
	test(a);
    return 0;
}
