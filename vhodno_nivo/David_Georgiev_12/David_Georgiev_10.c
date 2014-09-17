#include <stdio.h>

int main()
{
	int temp = 0;
	int sum = 0;
	int x;
	int z = 1;
	int i = 0;
	int a[10];

	printf("x = ");
	scanf("%d", &x);

	if((x < 0) || (x >= 10))
	{
		printf("error ((x < 0) || (x >= 10))\n");
	}
	else
	{
		while(i <= 10)
		{	
			if(z == 1)
			{
				if(z%x == 0)
				{
					i++;
					a[i] = 1;
				}
				temp = z;
				z = 2;
				if(z%x == 0)
				{
					i++;
					a[i] = 2;
				}
				sum = z + temp;
				if(sum%x == 0)
				{
					i++;
					a[i] = sum;
				}
			}
			temp = sum;
			sum = sum + z;
			if(sum%x == 0)
			{
				i++;
				a[i] = sum;
			}
			z = temp;
			
		}
	}
	for(i = 1; i <= 10; i++)
	{
		printf("%d\n", a[i]);
	}

	return 0;
}