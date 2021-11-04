/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int a, long long int b,long long int c);

int main(void)
{
	long long int a = 2, b = 3, c = 18;
	for(int i = 0;i<10;i++){
		a = a * -1;
		b = (b * i + c)% 53;
		c = (c * i + b)% 53;
		long long int r = test(a,b,c);
		printf("Result of test(%lld,%lld,%lld) = %lld\n", a,b,c,r);
	}
    return 0;
}
