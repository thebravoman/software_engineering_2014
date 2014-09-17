#include<stdio.h>

int main()
{
	int x, y, j, i, flag, number;
	printf("Enter two numbers: ");
	scanf("%d %d", &x, &y);
	if (x<y)
	{
		for(i = 0; i <= y; i++)
		{
			if (i >= x)
			{
				for(j=2; j <= i/2; ++j)
  				{
					flag = 0;
      				if(i % j == 0)
      				{
          				flag = 1;
          				break;
      				}	
  				}
				number = i;
		
				if (flag == 0)
				{
					if(i % 10 == 3)
					{
						printf("%d ", number);
					}
				}
			}	
		}
	}else {
		printf("Error! The first number must be smaller than the second. Try again!");
	}
	return 0;
}
