#include "stdio.h"

void main()
{
	int x,y,deliashtise=0;
	printf("vavedi nachalno chislo X\n");
	scanf("%d", &x);
	printf("vavedi kraino chislo Y\n");
	scanf("%d", &y);
	
	while(x<=y)
	{
		if(x%17 == 0)
			deliashtise=deliashtise+x;
		x++;
	}
	
	printf("sbora na deliashtite se na 17 chisla e: %d\n", deliashtise);
	
}
