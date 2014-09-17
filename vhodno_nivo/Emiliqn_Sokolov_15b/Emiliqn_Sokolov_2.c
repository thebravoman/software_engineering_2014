#include <stdio.h>

int main()
{
	int x,y;
	int sum = 0;
	printf("Vavedi x\n");
	scanf("%d",&x);
	printf("Vavedi y\n");
	scanf("%d",&y);
	if(y<=x)
	{
		printf("Y e po malak ili raven na X\n");
	}
	else
	{
		while(x<=y)
		{
			if(x%17 == 0)
			{
				sum = sum + x;
			}
		x = x + 1;
		}
		printf("SUMATA E: %d\n",sum);
	}

	return 0; 
}
