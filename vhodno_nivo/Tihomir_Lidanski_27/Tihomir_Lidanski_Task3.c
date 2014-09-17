#include <stdio.h>

void main()
{
   int x;
   int y;
   int i;
   
   scanf("%d", &x);
   scanf("%d", &y);
   
    for (x=x;x<=y;x++)
        {
            if(i>=x && i<=y && i%10 == 3)
                {
                    printf("%d", i);
                    i++;
                }
            
        }               
}