#include <stdio.h>
#include <stdlib.h>

int main()
{
	int x;
	while((x >= 10) || (x < 0))
	{
		scanf("%d", &x);
		if((x >= 10) || (x < 0)) 
		{
			printf("Please type a number that is between 1 and 9 including them \n");
		}
		else if(x == 0)
		{
			printf("It is not possible to divide with zero! \n");
		}
	}
	int divider = x;
	int i = 0;
	int fibonacci_num[9];
	fibonacci_num[9] = 0;	
	int holder;
	int carry1 = 0;
	int carry2 = 1;
	while(fibonacci_num[9] == 0)
	{
		holder = carry1 + carry2;
		if(holder % divider == 0)
		{
			fibonacci_num[i] = holder;
			i++;
		}
		carry1 = carry2;
		carry2 = holder;
	}
	printf("Numbers are:");
	for(i = 0;i <= 9;i++)
	{
		printf("%d\n",fibonacci_num[i]);
	}
	

	return 0;
  }
