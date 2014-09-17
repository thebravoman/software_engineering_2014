#include<stdio.h>

int main()
{
	int x,y,i;
	
	printf("Insert x:");
	scanf("%d", &x);
	do
	{
		printf("Insert y (y>x):");
		scanf("%d", &y);
	}
	while(x>=y);

	for(i=0;i<=(y-x);i++)
	{
		if((x+i)%(10)==3) printf("%d\n", (x+i));
		
	}
	return 0;
}
