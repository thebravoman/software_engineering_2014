#include <stdio.h>

int main()
{
	int a = 0;
	int b = 0;
	int count = 0;
	int conf = 0;

	do
	{
		scanf("%d", &a);
		scanf("%d", &b);

		if (a >= b)
		{
			printf("ERROR\n");
		}
	}while(a >= b);

	do
	{		
		for (count = 2; count < a; count++)
		{			
			if (count % a == 0 && count != a)
			{
				conf = 1;
			}
			
			if (conf == 0)
			{
				if (a % 10 == 3)
				{
					printf("%d\n", a);
					break;
				}
			}
			else
			{
				conf = 0;
			}
		}	
		a++;
	}while(a <= b);	
 
	return 0;
}
