#include <stdio.h>

int main()
{
	int x = 10;
	int y = 1;
	while(x > y)
	{
		scanf("%d,%d", &x,&y);
	}
	int holder[2727];
	int i = 1;
	while(x <= y)
	{
		if(x % 17 == 0)
		{
			holder[i] = x;
			i++;
		}
		x++;
	}
	x = 1;
	for(x = 1; x < i; x++)
	{
		printf("%d\n", holder[x]);
	}
	return 0;
	
}
