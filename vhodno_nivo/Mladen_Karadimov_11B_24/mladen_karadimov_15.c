#include<stdio.h>

int main()
{
	int x;
	int arrayList[9];
	int i;
	int count;

	scanf("%d",&x);

	for(i = 0; i < 10; i++)
	{
		arrayList[i] = 0;
	}

	for(i = 1; i <= 10; i++)
	{
		for(count = 0; count < 1000; count++)
		{
			if(count % (i*x) == 0)
			{
				arrayList[i-1] = arrayList[i-1] + count;
			}
		}
	}
	
	for(i = 0; i < 10; i++)
	{
		printf("%d\n",arrayList[i]);
	}
	return 0;
	
}
