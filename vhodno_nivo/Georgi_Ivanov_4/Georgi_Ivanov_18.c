#include "stdio.h"

int main()
{
int prime,a=0,i=0,x,deliteli[10];

printf("Vavedi X\n");
scanf("%d", &x);

while(i<=x)
{
	if (i%2 != 0)
	{
		if (x%i == 0)
		{
		deliteli[a]=i;
		a++;
		}
	}
	if (a==10)
	break;
	i++;
}

while (a<10) /* ako ostanat nepopulneni mesta v masive se zamenqt s 0 */
{
	deliteli[a]=0;
	a++;
}

printf("Tova sa nechetnite deliteli na X\n");
i=0;
while (i<10)
{
	if (deliteli[i] != 0)
	printf("%d  ", deliteli[i]);
	i++;
}

printf("\ntova sa prostite nechetni deliteli na X\n");

for (i=0; i<10; i++)
{
	for(a=2; a<deliteli[i]/2; a++)
	{
	if (deliteli[i]%a == 0)
	break;
	}
	if (!(a<deliteli[i]/2))
	{
		if (deliteli[i]>0)
		printf("%d  ", deliteli[i]);
	}	
}
}
