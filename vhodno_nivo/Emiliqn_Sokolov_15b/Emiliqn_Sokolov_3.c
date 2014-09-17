#include <stdio.h>

int main()
{
	int x,y,i;
	int c = 0;
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
			if(x%10 == 3)
			{
				for (i = 2; i < x; i++)
				{
					if(x%i == 0)
					{
						c = c+1;
					}
				}	
				if(c==0)
				{
					printf("%d ",x);
        			}
			}
		c = 0;
		x = x+1;
		}
	}
	printf("\n");

	return 0; 
}
