#include <stdio.h>

int main()
{

	int x,y,i,s=0;
	
	scanf("%d %d" ,&x,&y);
		if(x<y)	
		{
		 for(i=x;i<=y;i++)
		{
		if(i%17==0)
			{		
			s=s+1;
			}
		}	
		printf("%d\n" ,s);
		}
		else
		{
		printf("Error\n");
		}	
return 0;
}
