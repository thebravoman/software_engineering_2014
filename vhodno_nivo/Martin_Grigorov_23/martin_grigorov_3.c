#include <stdio.h>

int main()
{
	int x=0;
	int y=0;
	int k=0;
	int j;
	
	printf("vuvedi 'x' i 'y' (x<y) :\n");
	scanf("%d %d",&x,&y);
	for(k=x;k<y;k++)
	{
		for(j=2;j<k;j++)
		{
			if(k%j==0)
			{
				break;
			}					
		}
		if(k==j)
		{      
			if(k%10==3)
			{
				printf("%d\n",k);
			}				
		}	
	}
  	return 0;
}
