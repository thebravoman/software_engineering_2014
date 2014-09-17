#include <stdio.h>

int main()
{
	int x, y;
	printf("Enter two integer numbers, x and y, where x < y: ");
	scanf("%d %d", &x, &y);
	int fibonacci = 1, a = 0, b = 1;
	if (x < y)
	{
		while(fibonacci <= y)
		{
			if(fibonacci >= x)
			printf("%d ", fibonacci);
			fibonacci = a + b;
			a = b;
			b = fibonacci;
		}
   	}
	else
	{
		printf("Error\n");
	}

	return 0;
}
