#include <stdio.h>

int main()
{
	int x = 27;
	int y = 7;
	while(x > y)
	{
		scanf("%d,%d", &x,&y);
	}
	int i = 0;
	int holder;
	int carry1 = 0;
	int carry2 = 1;
	int fibonacci_num[2727];
	while(y >= carry1 + carry2)
	{
		holder = carry1 + carry2;
		if((holder >= x) && (holder <= y))
		{
			fibonacci_num[i] = holder;
			i++;
		}
		carry1 = carry2;
		carry2 = holder;
	}
	int i2 = i;
	for(i = 0; i < i2; i++)
	{
		printf("%d\n", fibonacci_num[i]);
	}
}
