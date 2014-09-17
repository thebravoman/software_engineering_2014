#include <stdio.h>

int main()
{
	int num,i,count,min,max;

	printf("x: ");
	scanf("%d",&min);
	printf("y: ");
	scanf("%d",&max);
	if(max<=min)
	{
		printf("invalid input\n");
	}
	for(num = min;num<=max;num++)
	{
		count = 0;
		for(i=2;i<=num/2;i++)
		{
			if(num%i==0)
			{
				count++;
				break;
			}
		}
		if(count==0 && num!= 1)
		{
			if(num % 10 == 3)
				printf("%d ",num);
		}    
	}
	return 0;
}
