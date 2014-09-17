#include <stdio.h>

int main()
{

	int x,y,i;
	
	scanf("%d %d" ,&x,&y);
	if(x<y)	
	{
	for(i=x;i<=y;i++)
	{
		if ((i % i == 0)&&(i % 1 == 0))
		{
		if(i % 10 == 3)
		{
		printf("%d\n" ,i);
		}
	}
	}
	}
	else
	{
		printf("Error\n");
	}	

return 0;
}
