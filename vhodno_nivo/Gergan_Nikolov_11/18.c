#include <stdio.h>

int main()
{
	int x = 0;

	do
	{
		scanf("%d", &x);
	}while(x < 0);	

	int num = 0;
	int num1 = num + 1;
	int array[10];
	int i = 0;

	do
	{
		if (num1 % x == 0)
		{
			array[i] = num1;
			i++;
		}
		num += 2;
		num1 = num + 1;	
	}while(i < 10);	

	i = 0;

	printf("Array : \n");
	do
	{
		printf("%d\n", array[i]);
		i++;
	}while(i < 10);

	i = 0;
	int c;

	printf("Prime deviders : \n");
	do
	{
		for (c = 2 ; c <= array[i] - 1 ; c++)
		{
			if (array[i] % c == 0 && array[i] != c)
			{
				break;
			}
		}

		if (c == array[i])
		{
			printf("%d is prime.\n", array[i]);
		}	
		i++;
	}while(i < 10);
	
	return 0;
}
