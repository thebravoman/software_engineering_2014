#include <stdio.h>
/*Да се разработи програма, която изисква от потребителя да въведе целочислено
число x, където 0<=x<10. Да се инициализира масив от 10 елемента. Да се намерят
първите 10 числа на Фибоначи в [0; +∞), които се делят на x без остатък.
Намерените стойности да се зададат като стойности на елементите в масива.
Елементите на масива да се изведат на стандартния изход.
*/
#define MAXA 10
#define MAX 1000

int main()
{
	int x, first = 1, second = 1, next = 1;
	int c, a = 0;
	int arr[MAXA];
	printf("Enter the number (0<x<10):");
	scanf("%d", &x);
	
	if(x > 0 && x < 10)
	{
		for ( c = 0 ; c < MAX ; c++ )
		{
			if(next%x == 0 && a < MAXA)
			{
				arr[a++] = next;
				next = first + second;
				first = second;
				second = next;
			
			}
			else
			{
				next = first + second;
				first = second;
				second = next;
			}
		}
		
		if(x == 1)
		{
			printf("1\n");
			for(c = 0; c < MAXA - 1; c++)
			{
				printf("%d\n", arr[c]);
			}
		}
		else
		{
			for(c = 0; c < MAXA; c++)
			{
				printf("%d\n", arr[c]);
			}
		}
	}
	else
	printf("Look AGAIN the conditions!!!\n"); 
 
	return 0;
}
