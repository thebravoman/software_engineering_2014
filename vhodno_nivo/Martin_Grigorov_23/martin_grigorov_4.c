#include <stdio.h>

int main()
{
	int x,y,count,i1=0,i2=1,result=0;

	printf("vuvedi 'x' i 'y' (x<y) :\n");
	scanf("%d %d",&x,&y);
	if(x==1) 
	{
		printf("Fibonacci Series: %d,",i2);
	}
	
	count=2;
	while(result<y)
	{
		result=i1+i2;
		i1=i2;
		i2=result;
		++count;
		if((result<=y) && (result>=x))
		{
			printf("%d,",result);	
		}	
	}

	return 0;
}
