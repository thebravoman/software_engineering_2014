#include <stdio.h>

int main()
{
	int x,y,i;   
	int sum = 0;
	printf("x: ");
	scanf("%d", &x);
	printf("y: ");
	scanf("%d", &y);
	if(y<=x)
	{
		printf("invalid input\n");
	}
	else
	{
		for(i = x; i < y; i++)
		{
			if(i%17 == 0)
				{
					sum = sum + i;
				}
		}
	}
	printf("sum: %d\n", sum);
	return 0;
}
