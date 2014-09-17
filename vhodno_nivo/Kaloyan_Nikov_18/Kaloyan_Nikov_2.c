#include <stdio.h>

int main()
{
	int x = 27;
	int y = 7;
	while(x > y)
	{
		scanf("%d,%d", &x,&y);
	}
	int holder = 0;
	int i = 1;
	while(x <= y)
	{
		if(x % 17 == 0)
		{
			holder = holder + x;
		}
		x++;
	}
	printf("%d\n", holder);
	return 0;
}
