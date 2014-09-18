/* 8. Да се разработи програма, която изисква от потребителя да въведе целичислено
                                                                             число х, където 0<x<100. Да се инициализира масив от 10 целочислени елемента,
                                                                                                                                             всеки един >x. Всеки нечетен елемент да се запише в нов масив. Полученият масив
                                                                                                                                                                                                                       да се изведе на екрана.
*/


#include <stdio.h>

int main ()
{
	int i,x, a[10],b[10];
	printf("Enter number:");
	scanf("%d",&x);
	if(x>0 && x<100)
	{
		for(i=1 ; i<=10 ;i++)
		{
			printf("Enter numbers in array:");
			scanf("%d",&a[i]);
			if(a[i]<x)
			{
				do
				{			
					printf("Error! Enter new numbers in the array:");
					scanf("%d", &a[i]);
				}while(a[i]<=x);		
			}
		}
	
		for(i=1; i<=10; i++)
		{
			if(a[i] % 2 != 0) 
			{		
				b[i]=a[i];
				printf("Numbers in the new array: %d\n",b[i]);
			}		
		}
	}


	else 
	{
		do
		{
			printf("Error! Enter new number:");
			scanf("%d",&x);
			if(x>0 && x<100)
			{
				for(i=1 ; i<=10 ;i++)
				{
					printf("Enter numbers in array:");
					scanf("%d",&a[i]);
				if(a[i]<x)
				{
					do
					{			
						printf("Error! Enter new numbers in the array:");
						scanf("%d", &a[i]);
					}while(a[i]<=x);		
				}
			}
	
			for(i=1; i<=10; i++)
			{
				if(a[i] % 2 != 0) 
				{		
					b[i]=a[i];
					printf("Numbers in the new array: %d\n",b[i]);
				}		
			}				
			}	
		}while(x<=0 || x>=100);
	}
	return 0;
}
