#include <stdio.h>

int main()
{
	int result=0;
	int x=0;
	int y=0;
	int k=0;
	
	printf("vuvedi 'x' i 'y' (x<y) :\n");
	scanf("%d %d",&x,&y);
	for(k=x;k<y;k++)
	{
		if(k%17==0)
		{
			result+=k;
		}			
	}
	printf("result: %d\n",result);
	
	return 0;
}
