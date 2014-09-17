#include <stdio.h>

int main()
{
	int x, y;
	printf("Enter two integer numbers, x and y, where x < y: ");
	scanf("%d %d", &x, &y);
	int sum = 0, i;
	if (x < y)
	{
		for (i = x; i <= y; i++)
		{
			if((i % 17) == 0)
			{
				sum = sum + i;
			}
		}
		printf("The sum in the interval: %d\n", sum);
   	}
	else
	{
		printf("Error\n");
	}

	return 0;
}
