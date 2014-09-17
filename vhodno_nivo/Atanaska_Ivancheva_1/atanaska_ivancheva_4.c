#include<stdio.h>
int main()
{
	int x,y,first=1,second=1,sum;
	scanf("%d %d",&x ,&y);
	
	if(x<y)
	{
		do
		{
			sum=first+second;
			first=second;
			second=sum;
			if((sum>=x)&&(sum<=y))
			{
				printf("%d, "sum);
			}while(second<y);
		}
	}
	else if(x>y)
	{
		printf("Interval must be increasing");
	}
return 0;
}
