#include<stdio.h>

int main()
{
	int x, y, i;
	printf("Enter two numbers: ");
	scanf("%d %d", &x, &y);
	int sum = 0;
	if (x < y)
	{
		for (i = 0; i <= y; i++)
		{
			if (i >= x)
			{
				if (i % 17 == 0)
				{
					sum += i;
				}
			}
		}
	} else {
		printf("Error! The first number must be smaller than the second. Try again!");
	}
	printf("%d", sum);
	return 0;
}
