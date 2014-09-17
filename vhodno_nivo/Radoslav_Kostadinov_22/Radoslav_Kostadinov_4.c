#include<stdio.h>
int main()
{	
	int x,y,i,fib1=0,fib2=1,fib3=0;
	printf("Now you should enter two integer numbers(x<y)\nEnter X: ");
	scanf("%d", &x);
	do
	{
		printf("Vuvedete Y: "); 
		scanf("%d", &y);
	}
	while(x>=y);

		for (i = x; i <= y; i++)
		{
			if (fib3 <= y)
			{
				if (fib3 >= x)
				{
					printf("%d\n", fib3);
				}
				fib1 = fib2;
				fib2 = fib3;
				fib3 = fib1+fib2;
			}
		}
	
	return 0;
}

