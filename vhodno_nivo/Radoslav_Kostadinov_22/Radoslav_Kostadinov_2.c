#include<stdio.h>
	
int main()
{	
	int x,y,i,sum;
	printf("Now you should enter two integer numbers(x<y)\nEnter X: ");
	scanf("%d", &x);
	
	do
	{
		printf("Vuvedete Y: "); 
		scanf("%d", &y);
	}
	while(x>=y);

	for(i=x;i<=y;i++)
	{
		if(i%17 == 0)	
		{
			sum+=i;
		}
	
	}

	printf("The Sum of the numbers in the interval[%d,%d] that divide to 17 is %d\n", x,y,sum);	
	return 0;
}
