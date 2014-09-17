#include<stdio.h>

int main()
{
	int x,y,i1,i2,temp;
	
	printf("Insert x:");
	scanf("%d", &x);
	do
	{
		printf("Insert y (y>x):");
		scanf("%d", &y);
	}
	while(x>=y);

	i1=1;
	i2=0;
	while(i1<=y)
	{	
		if(i1>=x) printf("%d\n", i1);
		temp=i1;
		i1=i1+i2;
		i2=temp;	
	}
 
	return 0;
}
