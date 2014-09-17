#include <stdio.h>
/*Да се разработи програма, която изисква от потребителя да въведе целочислено
число x, където 0<x<10. Да се инициализира масив от 10 елемента. Да се намери
първото число на Фибоначи в интервала [0; +∞) завършващо на x и да се запише
като първи елемент в масива. Да се намери второто число на Фибоначи в
интервала [0; +∞) завършващо на x и да се запише като втори елемент в масива.
Аналогично да се намерят първите N прости числа в интервала [0; +∞) и да се
запишат като елемент N в масива. Масивът да се изведе на стандартния изход.
*/
#define MAXA 10
#define MAX 1000

int main()
{
	int x, first = 1, second = 1, next = 0;
	int c, a = 0;
	int arr[MAXA];
	printf("Enter the number x (0<x<10):");
	scanf("%d", &x);
	
	if(x > 0 && x < 10)
	{
		for ( c = 0 ; c < MAX ; c++ )
		{
			if(next%10 == x && a < MAXA)
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
		for(c = 0; c < MAXA; c++)
		{
			printf("%d\n", arr[c]);
		}
	
	}
	else
	printf("Look AGAIN the conditions!!!\n");
	
	return 0;
}
