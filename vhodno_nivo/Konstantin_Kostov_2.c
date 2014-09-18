#include <stdio.h>
int main()

{
int x,y;
printf("enter a number");
scanf("%d",&x);
printf("enter a number");
scanf("%d",&y);
while (x<=y)
{
if((x %17 == 0))
{
printf("%d\n",x);
}
x++;
}
return 0;
}
