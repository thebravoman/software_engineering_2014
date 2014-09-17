#include <stdio.h>

int main()
{
	int x,y,i,a,b,c;

	scanf("%d %d" ,&x,&y);
	if(x<y)
	{
	for(i=x;i<=y;i++)
	{
	if((i==0)||(i==1)){
   		printf("%d\n" ,i);
	}
	else
 	{
   		a=0;
   		b=1;
   		c=a+b;
   	while(c<i)
   	{
     		a=b;
     		b=c;
     		c=a+b;
   	}
   	if(c==i)
     		printf("%d\n" ,i);
	}
	}
	}
	else
	{
       		printf("Error\n");
	}

return 0;
}
