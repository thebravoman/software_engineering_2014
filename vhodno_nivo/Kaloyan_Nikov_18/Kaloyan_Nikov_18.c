#include <stdio.h>

int main()
{
	int x = -27;
	while(x < 0)
	{
		scanf("%d", &x);
	}
	if(x == 0)
	{
		x = 1;
	}
	int divisor = x; 
	int i = 0;
	int i2 = 0;
	int holder1;
	int number = 0;
	int dividers[9];
	while(number <= divisor)
	{
		number++;
		holder1 = divisor % number;
		if(holder1 == 0)
		{
			if(number % 2 == 1)
			{
				if(i <= 9)
				{
					dividers[i] = number;
					i++;
					i2++;
				}
			}
		}
	}

	for(i = 0; i < i2; i++)
	{
		printf("%d\n", dividers[i]);
	}
	i2 = 2;
	int i3 = 0;
	int flag = 0;
	int holder[9];
	for(i = 0; i < i2;i++)
	{
		while(i2 < dividers[i])
		{
			if(dividers[i] % i2 == 0 && i2 != dividers[i])
			{
				flag = 1;
			}
			i2++;
		}
		if(flag == 0)
		{
			holder[i3] = dividers[i];
			i3++;
		}
		flag = 0;
		i2 = 2;
		
	}
	printf("Prime numbers from massive\n");
	for(i = 0; i < i3; i++)
	{
		printf("%d\n", holder[i]);
	}
	return 0;
}
