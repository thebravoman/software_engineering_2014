/* Zadcha 2 */
#include <stdio.h>
int main()
{
	int x,y,n,s = 0;
	
	printf("First number - x:\n");
	scanf("%d",&x);
	printf("Second number - y:\n");
	scanf("%d",&y);
	
	if (x<y)
	{
		for(n=x; n <=y ; n++ )
		{
			if(n%17 == 0) {
				s = s + n;
			}	
		}
		printf(" Suma na chislata:%d",s);
	} 
	else
		printf("Error");
}
