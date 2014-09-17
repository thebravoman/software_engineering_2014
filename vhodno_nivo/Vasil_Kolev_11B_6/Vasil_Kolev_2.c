#include<stdio.h>

int main()
{
	int x,y,i;
	int res = 0;
	
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
		if((x+i)%(17)==0) res=res+(x+i);
		
	}
	printf("%d\n", res);
	return 0;
}
