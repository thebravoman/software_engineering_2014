#include <stdio.h>
#include <stdlib.h>

int prime_numbers(int number);

int main()
{
	int x;
	printf("Enter a number, x, where 0 <= x: ");
	scanf("%d", &x);
	int a[10], t = 0;
	int i, size = 10, flag = 0;
	if (0 <= x)
	{
		for(i = 1; i <= size; i++)
		{
			
			if (((x % i) == 0) && ((i % 2) != 0))
			{
				a[t] = i;
				t++;
				flag++;
			}
			if (flag == 10)
			{
				break;
			}
			size++;
		}

   	}
	else
	{
		printf("Error\n");
		exit(0);
	}
	printf("The odd divisors are: ");
	for (t= 0; t < 10; t++)
	{
		printf("%d ", a[t]);
	}
	t= 0;
	printf("\nThe prime odd divisors are: ");
	for(i = 0; i < 10; i++)
	{
		flag = prime_numbers(a[t]);
		if(flag == 0)
		{
			printf("%d ", a[t]);
		}
		t++;
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
