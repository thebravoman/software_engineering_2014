#include <stdio.h>

int main()
{
	int x;
	int a[10];
	int count = 0;
	
	printf("x = ");
	scanf("%d", &x);
	
	int first = 1;
	int second = 1;
	int next;
	int flag = 0;

	for(count = 0; count < 10; count++)
	{
		flag = 0;
		while(flag == 0)
		{
			next = first + second;
			first = second;
			second = next;
			if(next % 10 == x)
			{
				a[count] = next;
				printf("%d ", a[count]);
				flag = 1;
			}
		}
	}

	return 0;

}
