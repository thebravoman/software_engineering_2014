#include <stdio.h>

int main()
{
	int x, i; 
	printf("Enter a positive number: ");
	scanf("%d", &x);
	int a[10];
	int j = 0;
	int y, flag;
	for (i = 0; i <= 100000; i++)
	{
		if (i % 2 != 0)
		{
			if (x % i == 0)
			{
				a[j] = i;	
				j++;
			}
		}
	}	
	for (j = 0; j < 10; j++)
	{
		printf("The dividers are: %d \n", a[j]);
	}

	for (j = 0; j < 10; j++)
	{
		for(y = 2; y <= a[j]/2; ++y)
  		{
			flag = 0;
			if(a[j] % y == 0)
			{
				flag = 1;
				break;
			}
 		}
		if (flag == 0)
		{
			printf("The prime dividers are : %d \n", a[j]);
		}
	}
}
