#include <stdio.h>

int prime_numbers(int number);

int main()
{
	int x, y, flag, i;
	printf("Enter two integer numbers, x and y, where x < y: ");
	scanf("%d %d", &x, &y);
	if(x > y)
	{
		printf("Error\n");
	}
	if(x == 1)
	{
		x++;
	}
	for(i = x ; i <= y; i++)
	{
		flag = prime_numbers(i);
		if((flag == 0) && ((i % 10) == 3))
		{
			printf("%d\n", i);
		}
	}

	return 0;
}

int prime_numbers(int number)
{
	int i;
	int flag=0;
	for(i = 2; i <= number / 2; i++)
	{
		if (number % i == 0)
		{
			flag = 1;
			break;
		}
	}

	return flag;
}
