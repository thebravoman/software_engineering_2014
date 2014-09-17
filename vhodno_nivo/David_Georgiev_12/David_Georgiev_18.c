#include <stdio.h>

int main()
{
	int x;
	int i = 0;
	int k = 0;
	int j = 2;
	int a[10];
	int flag = 0;
	
	printf("x = ");
	scanf("%d", &x);
	if(x < 0)
	{
		printf("error (x < 0)\n");
	}
	while(i <= 10)
	{	
		k++;
		if((k%2 == 1) && (k%x == 0))
		{
			i++;
			a[i] = k;
		}
	}
	for(i = 1; i <= 10; i++)
	{
		printf("%d\n", a[i]);
	}
	printf("\nprime numbers\n\n");
	for(i = 1; i <= 10; i++)
	{	
		while(j < a[i])
		{	
			if(a[i]%j == 0)
			{
				flag = 1;
			}
			j++;
		}
		if(flag == 0)
		{
			printf("%d\n", a[i]);
		}
		else
		{
			flag = 0;
		}
		j = 2;
	}
	
	return 0;
}