#include <stdio.h>

int numberCheck(int number);

int main()
{
	int x;
	int arrayList[9];
	int i;
	int arrayCount = 0;	

	scanf("%d", &x);

	for(i = 0; i < 10; i++)
	{
		arrayList[i] = 0;
	}

	while(arrayCount <= 10)
	{
		i++;
		
		if(i % 10 == x)
		{
			int check = numberCheck(i);
			if(check != 0)
			{
				arrayList[arrayCount] = i;
				arrayCount++;
			}			
		}
	}
	

	for(i = 0; i < 10; i++)
	{
		if(arrayList[i] == 0)
		{
			printf("NOT possible ");
		}
		else
		{
			printf("%d ",arrayList[i]);
		}	
	}

	return 0;
}

int numberCheck(int number)
{
	int i = 1;
	while(i < number)
	{
		i++;
		if((number % i == 0) && (i != number))
		{
			
			return 0;
			
		}
	}
	return 1;
}
