#include <stdio.h>
#include <stdlib.h>

int main()
{
	int x;
	printf("Enter a number, x, where 0 < x < 10: ");
	scanf("%d", &x);
	int a[100], t = 0;
	int b[100], f = 0, i, size;
	if ((0 < x) && (x < 10))
	{
		for (i = 0; i < 100; i++)
		{
			a[t] = i;
			if ((a[t] % 10) == x)
			{
				printf("%d\n", a[t]);
			}
			else
			{
				b[f] = a[t];
				f++;
			}
			t++;
		}
   	}
	else
	{
		printf("Error\n");
		exit(0);
	}
	size = f;
	f = 0;
	for (i = 0; i < size; i++)
	{
		printf("%d\n", b[f]);
		f++;
	}

	return 0;
}
