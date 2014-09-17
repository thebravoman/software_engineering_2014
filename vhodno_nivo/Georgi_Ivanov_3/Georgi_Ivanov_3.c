#include "stdio.h"

void main()
{
	int x,y,i;
	
	printf("vavedi nachalno chislo X\n");
	scanf("%d", &x);
	printf("vavedi kraino chislo Y\n");
	scanf("%d", &y);
	
	while (x<=y)
	{
		if(x%10 == 3)
		{
			for(i=2; i<x/2; i++)
			{
				if(x%i == 0)
				break;
				
			}
			if(!(i<x/2))
			printf("Prostite chisla zavurshvashti na 3 sa:\n%d", x);
		}
		x++;
	}
}
