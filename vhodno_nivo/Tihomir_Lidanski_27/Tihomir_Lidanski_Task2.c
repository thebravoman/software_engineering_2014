#include <stdio.h>

void main()
{
   int x;
   int y;
   int sum = 0;
   
   scanf("%d", &x);
   scanf("%d", &y);
   
    for (x=x;x<=y;x++)
        {
            if (x % 17==0)
            {
                sum+=x;
            }
        }
printf("%d", sum);        
}