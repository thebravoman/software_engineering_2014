#include <stdio.h>

int main()
{
	int min,max;
	int C = 0;
	int B = 1;
	int A = 0;
	printf("x: ");
	scanf("%d",&min);
	printf("y: ");
	scanf("%d",&max);
	if(max<min)
	{
		printf("invalid input\n");
	}
	while(A < max)
	{
		if(A > min)
			printf("%d ", A);

			C = A + B;
			A = B;
			B = C;
	}
	return 0;
}
