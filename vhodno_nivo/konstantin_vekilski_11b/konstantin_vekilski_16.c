#include <stdio.h>

int main()
{
	int x;
	int a[10];
	int count;
	int i = 2;
	int c;

	printf("x = ");
	scanf("%d", &x);
	
	for(count = 0; count < 10; )
	{
		for(c = 2; c <= i - 1 ; c++)
		{
			if(i % c == 0)
				break;
		}
		if(c == i)
		{
			if(i % 10 == x)
			{
				a[count] = i;
				printf("%d ", a[count]);
				count++;
			}
		}
		i++;
	}
	

	printf("\n");
	return 0;
}
