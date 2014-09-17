#include<stdio.h>
int main()
{
	int x,y,number;
	scanf("%d %d",&x ,&y);

	if(x<y)
	{
		if(x<3<y)
		{
			printf("3, ");
		}
		for(number=x; number<=y; number++)
		{
			if(number%2!=0 && number%3!=0)
			{
				if((number-3)%10==0)
				{
					printf("%d, ",number);
				}
			}
		}
	}
	else if(x>y)
	{
		printf("Interval must be increasing");
	}
return 0;	
}