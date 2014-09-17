#include<stdio.h>

int main()
{
	int x,k,n;
	int i = 1;
	int m = 0;
	int c = 0;
	int flag = 0;
	int a[10];
	printf("Vavedi chislo\n");
	scanf("%d",&x);
	if(x >= 0)
	{
		while(m < 10)
		{
			if(i%x == 0)
			{
				a[m] = i;
				m = m + 1;
			}
			i = i + 2;
		}
		for(k = 0; k < m; k++)
		{
			printf("%d ",a[k]);
		}
		printf("\n");
		printf("Prostite chisla sa: ");
		for(k = 0; k < m; k++)
		{
			for (n = 2; n < a[k]; n++)
			{
				if(a[k]%n == 0)
				{
					c = c+1;
				}
			}	
			if(c==0)
			{
				printf("%d ",a[k]);
				flag = 1;
        		}
			c = 0;
		}
		if(flag == 0)
		{
			printf("0");
		}
		printf("\n");
	}

	return 0;
}
