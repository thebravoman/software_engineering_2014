/* Zadcha 3 */
#include <stdio.h>
int main()
{
	int x,y,n,z;
	int s = 1;
	printf("First number - x:\n");
	scanf("%d",&x);
	printf("Second number - y:\n");
	scanf("%d",&y);
	
	if (x<y)
	{
		for (n=x; n <=y ; n++)
            {
                if (n%10 == 3)
                {
                    for(z = 2; z <= n; z++)
                     {
                     if(n%z == 0)
                        {
                           if (z!=n) break;
                           printf("%d\n", n);
                        }

                      }
                }
             }	
	} 
	else
		printf("Error");
}

