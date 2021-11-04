/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int a, long long int b);
void printa_binario(long long int n){
	printf("%lld : \n",n);
	unsigned long long int test = n;
	char s[65];
	s[64] = '\0';
	int j = 63;
	for(int i=0;i<64;i++){
		s[j] = test%2 + '0';
		test = test/2;
		j--;
	}

	printf("%s\n",s);
}
/*
1111111111111111000000000000000011111111 111111110000 000000000000

00000000 000000001111 11111111111100000000000000001111111111111111
=
00000000 111111110000 11111111111100000000000000001111111111111111
         111111110000
*/
int main(void)
{
	long long int a = 0xffff0000ffff0000, b = 0x0000ffff0000ffff;
	long long int r = test(a,b);
	printa_binario(a);
	printa_binario(b);
	printa_binario(r);
	printf("Result of test(%lld,%lld) = %lld\n", a,b,r);
    return 0;
}
