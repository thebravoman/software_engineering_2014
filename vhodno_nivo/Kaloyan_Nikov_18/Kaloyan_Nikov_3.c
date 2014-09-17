#include <stdio.h>

int main()
{
	int x = 27;
	int y = 7;
	while(x > y)
	{
		scanf("%d,%d", &x,&y);
	}
	int i;
	int i2 = 0;
	int carry;
	int flag =0;
	int holder[2727];
	
	while(x < y)
	{
	for(i=2; i<x;i++)
	{
		if(x % i == 0 && i != x)
		{
			flag = 1;
		}
	}
	if(flag == 0)
	{
		carry = x;
		while(carry > 9)
		{
			carry = carry - 10;
		}
		if(carry == 3)
		{
			holder[i2] = x;
			i2++;
		}
	}
	flag = 0;
	x++;
	}
	
	for(i = 0; i < i2; i++)
	{
		printf("%d\n", holder[i]);
	}
	return 0;
}
