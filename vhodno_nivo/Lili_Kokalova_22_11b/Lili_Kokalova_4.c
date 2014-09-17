#include<stdio.h>

int main()
{
	int x,y,c;
	printf("Enter two numbers: ");
	scanf("%d %d", &x, &y);
	int counter = 1;
	int fibnum = 0, b = 1;
	if (x < y)
	{
		while(counter <= y)
    	{
			c = fibnum + b;
    	   	fibnum = b;
    	   	b = c;
    	   	if ((fibnum >= x) && (fibnum <= y))
			{
				printf("%d ", fibnum);
			}    	
       		counter++;
    	}
	}else{
		printf("Error! The first number must be smaller than the second. Try again!");
	}
	return 0;
}
