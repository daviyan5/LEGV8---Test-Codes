/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int a);

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
int main(void){

	long long int a = 1;
	long long int r;
	for(int i = 0;i<5;i++){
		a = (a * i + a)%31;
		long long int r = test(a);
		printa_binario(a);
		printa_binario(r);
		printf("Result of test(%lld) = %lld\n", a,r);
	}
    return 0;
}
