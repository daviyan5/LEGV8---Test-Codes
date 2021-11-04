/* main.c simple program to test assembler program */

#include <stdio.h>
#include <stdlib.h>
extern long long int test(char* a,char* b, long long int *freqA,long long int *freqB);

int main(void){

	char a[] = "grnrclszemskvbgcluwtgyvieip";
	char b[] = "leg";
	long long int *freqA, *freqB;
	freqA = (long long int*) malloc(26 * sizeof(long long int));
	freqB = (long long int*) malloc(26 * sizeof(long long int));
	long long int r = test(a,b,freqA,freqB);
	printf("A resposta para %s e %s é %lld\n",a,b,r);
    return 0;
}
