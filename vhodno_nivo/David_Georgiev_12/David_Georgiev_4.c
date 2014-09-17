#include <stdio.h>

int main()
{
	int temp = 0;
	int sum = 1;
	int x;
	int y;
	int z = 1;

	printf("x = ");
	scanf("%d", &x);
	printf("y = ");
	scanf("%d", &y);

	if(x >= y)
	{
		printf("error ((x > y) or (x = y))\n");
	}
	else
	{
		while(sum < y)
		{	
			if(z == 1)
			{
				if(sum >= x)	
				{
					printf("1\n1\n");
				}
				temp = z;
				z = 2;
				if(sum >= x)
				{
					printf("2\n");
				}
				sum = z + temp;
				if(sum >= x)
				{
					printf("%d\n", sum);
				}
			}
			temp = sum;
			sum = sum + z;
			if((sum <= y) && (sum >= x))
			{
				printf("%d\n", sum);
			}
			z = temp;
			
		}
	}

	return 0;
}