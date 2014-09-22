#include <stdio.h>

int main()
{
	int x;
	int arrayList[9];
	int question = 1;
	int arrayCount = 0;
	int i;
	int helper;

	do
	{
		scanf("%d",&x);
	}while(x<0);

	for(i = 1; i <= x; i++)
	{
		if((i % 2 != 0) && (arrayCount<=10) && (x % i == 0))
		{
			arrayList[arrayCount] = i;
			arrayCount++;
		}
	}	

	printf("First even combinable numbers: ");

	for(i = 0; i < (arrayCount-1); i++)
	{
		printf("%d ",arrayList[i]);
	}	

	printf("\nThe simple numbers: ");
	
	for(i = 0; i < (arrayCount-1); i++)
	{ 
		question = 1;
		for(helper = 2; helper < arrayList[i]; helper++)
		{
			if(arrayList[i] % helper == 0)
			{
				question = 0;
			}
		}	
		if(question == 1)
		{
			printf("%d ",arrayList[i]);
		}
	}


	return 0;	
}









