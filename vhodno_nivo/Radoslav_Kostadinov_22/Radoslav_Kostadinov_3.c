#include<stdio.h>
int prime_checker(int n);

int main()
{	
	int x,y,i;
	printf("Now you should enter two integer numbers(x<y)\nEnter X: ");
	scanf("%d", &x);
	
	do
	{
		printf("Vuvedete Y: "); 
		scanf("%d", &y);
	}
	while(x>=y);

	for(i=x;i<=y;i++)
	{
		if(prime_checker(i))
		{
			if(i%10==3)printf("%d\n", i);
		}

	}	
	return 0;
}


int prime_checker(int a)
{
   int c;
 
   for (c=2;c<=a-1;c++)
   { 
      if (a%c==0)
	 return 0;
   }
   if (c==a)
      return 1;
}
