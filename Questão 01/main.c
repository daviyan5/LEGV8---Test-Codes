/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int a, long long int b);

int main(void)
{
    long long int m = test(5, 9);
    printf("Result of test(5, 9) = %lld\n", m);
    m = test(12,12);
    printf("Result of test(12, 12) = %lld\n", m);
    m = test(15,7);
    printf("Result of test(15, 7) = %lld\n", m);
    return 0;
}
