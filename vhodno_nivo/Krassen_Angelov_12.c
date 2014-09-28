#include <stdio.h>
/*Да се разработи програма, която изисква от потребителя да въведе четири числа x,
y, w, h където x>0, y>0, w>0, h>0. Числото x е дължината на плоча дървесина, а
числото y е височината. Да се определи на колко цели плочи с размери w, h може
да се разреже голямата плоча. Да се инициализира масив от 10 елемента.
Стойностите на елементите на масива да са първите 10 координати по дължина на
плочата, в които тя трябва да се разреже, за да се получат по­малките плочи.
*/
#define MAX 10
	
int main()
{
	int x, y, w, h;
	int i, max; 
	int arr[MAX];
	
	printf("Enter x (x>0) :\n");
	scanf("%d", &x);
	printf("Enter y (x>y>0):\n");
	scanf("%d", &y);
	printf("Enter w (w>0):\n");
	scanf("%d", &w);
	printf("Enter h (w>h>0):\n");
	scanf("%d", &h);
	
	if(x > w && y > h && x > y && w > h && x > 0 && y > 0 && w > 0 && h > 0)
	{
	//............
		//int a, b, c, d; 
		int ab, cd;	
		int i, k;
		
		//a = x/w; //дължина към дължина (1)
		//b = y/h; //широчина към широчина (2)
		//c = x/h; //дължина към широчина (3)
		//d = y/w; //широчина към дължина (4)
		ab = (x/w)*(y/h); //(1)*(2) (максимален брой плочи - вар 1)
		cd = (x/h)*(y/w); //(3)*(4) (максимален брой плочи - вар 2)
		
		if(ab >= cd)
		{
			printf("Number of plates: %d\n", ab);
			
			for (k = w, i = 0; k <= x && i < MAX; i++)
			{
				arr[i] = k;
				k += w;
			}
		}
		else // ab < cd
		{
			printf("Number of plates: %d\n", cd);
		
			for (k = h, i = 0; k <= x && i < MAX; i++)
			{
				arr[i] = k;
				k += h; 
			}
		}
		max = i;
	}
	else 
	{
		printf("Look AGAIN the conditions!!!\n");
		printf("Number of plates: 0\n");
		for(i=0; i < MAX; i++)
		{
			arr[i] = 0;
		}
	}

	if(x%w == 0 || x%h == 0)
	{
		for(i=0; i < max - 1; i++)
		{
			printf("%d\n", arr[i]);
		}
	}
	else
	{
		for(i=0; i < max; i++)
		{
			printf("%d\n", arr[i]);
		}
	}
	return 0;
}
