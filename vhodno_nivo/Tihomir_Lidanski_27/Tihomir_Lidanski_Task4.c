#include <stdio.h>

void main()
{
   int x;
   int y;
   int sum = 0;
   int a;
   
   scanf("%d", &x);
   scanf("%d", &y);
   
    for (x=x;x<=y;x++)
        {
            a=x;
            sum = a+x;
            x++;
            
        }       
printf("%d", sum);        
}