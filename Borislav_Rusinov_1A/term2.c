/* 2. Да се разработи програма, която изисква от потребителя да въведе две
                                                                     целочислени числа, x и y, където x < y. Да се намери и изведе сумата на числата
                                                                                                                                           делящи се на 17 в интервал [x, y].
*/

#include <stdio.h>

int main()
{
	int x, y, i, sum;
	printf("Enter interval:");
	scanf("%d %d",&x,&y);
	sum=0;
	do
	{
		for(i=x; i<=y ; i++)
		{
			if(i%17==0)
			{
				sum=sum+i;
			}
		}
		printf("Sum: %d\n",sum);	
		if(x>y)
		{			
			printf("Error! Enter new interval:");
			scanf("%d %d",&x,&y);
			if(x<y)
			{
				for(i=x; i<=y ; i++)
				{
					if(i%17==0)
					{
						sum=sum+i;
					}
				}
				printf("Sum: %d\n",sum);	
			}
		}
	}while (x>y);
	return 0;
}
