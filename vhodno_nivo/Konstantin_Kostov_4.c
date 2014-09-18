#include <stdio.h>
int main()

{
int i=1;
int S=0;
int b=0;
int a=1;
int x,y;
printf("enter a number");
scanf("%d",&x);
printf("enter a number");
scanf("%d",&y);
while(i<=y)
{
S=a;
a = b;
b =S+b;
if ((i>=x)&&(i<=y))
{

printf("%d\n",b);
}
i++;
}
return 0;
}
