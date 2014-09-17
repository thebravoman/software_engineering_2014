#include<stdio.h>
int main()
{
	int x,y,sum=0,number;
	scanf("%d %d",&x ,&y);
	
	if(x<y)
	{
		for(number=x; number<=y; number++)
		{
			if(number%17==0)
			{
				sum=sum+number;
			}
		}
		printf("sum %d",sum);
	}
	else if(x>y)
	{
		printf("Interval must be increasing");
	}
return 0;
}
