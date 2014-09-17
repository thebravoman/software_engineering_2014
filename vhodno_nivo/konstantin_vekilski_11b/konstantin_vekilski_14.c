#include <stdio.h>

int main()
{
	int sum = 0;
	int i = 0;
	int i1 = 0;
	int i2 = 0;
	int flag;
	int a[10];
	int x;

	printf("x =");
	scanf("%d", &x);
	
	for(i = 0; i < 10; i++)
	{
		flag = 0;
		while(flag == 0)
		{
			i1++;
			if(i1 % x == 0)
			{
				flag = 1;
				sum = 0;
				for(i2 = 0; i2 <= i1; i2++)
				{
					sum += i2;
				}
				a[i] = sum;
				printf("%d ", a[i]);
			}
		}

	}
	printf("\n");
	return 0;
}
