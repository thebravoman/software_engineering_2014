/* 4. Да се разработи програма, която изисква от потребителя да въведе две
                                                                     целочислени числа, x и y, където x < y. Да се намерят и изведат всички числа на
                                                                                                                                           Фибоначи в интервала [x, y].
*/

#include <stdio.h>

int main()
{
	int x, y, i, fib, n1, n2;
	printf("Enter interval:");
	scanf("%d %d",&x,&y);
	n1= 1;
	n2= 1;
	fib= 1;
	do
	{
		for(i=1; i<=y ; i++)
		{
			if(i>2)	fib=n1 + n2;
			n1=n2;
			n2=fib;
			if(i>=x) printf("Fibonacci number: %d\n",fib);
		}
		if(x>y)
		{
			printf("Error! Enter new interval:");
			scanf("%d %d", &x,&y);
			for(i=1; i<=y ; i++)
			{
				if(i>2)	fib=n1 + n2;
				n1=n2;
				n2=fib;
				if(i>=x) printf("Fibonacci number: %d\n",fib);
			}
					
		}

	}while(x>y);

	return 0;
}
