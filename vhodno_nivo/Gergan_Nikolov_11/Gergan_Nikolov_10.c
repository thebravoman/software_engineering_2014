#include <stdio.h>

int main()
{
	int x = 0;
	int conf = 0;
	int i = 0;
	int c = 0, next, first = 0, second = 1;

	do
	{
		scanf("%d", &x);

		if (x < 0 && x >= 10) 
		{
			conf = 1;
		}
		else
		{
			conf = 0;
		}
	}while(conf != 0);	

	int array[10];

	do
	{
		if ( c <= 1 )
		{
		 	next = c;
		}		
		else
		{
			 next = first + second;
			 first = second;
			 second = next;
		}

		if (next % x == 0)
		{
			array[i] = next;
			i++;
		}		

		c++;
	}while(i < 10);

	for (i = 0; i < 10; i++)
	{
		printf("%d\n", array[i]);
	}

	return 0;
}
