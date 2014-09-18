
#include <stdio.h>

int main()
{
int a=0;
int b=0;
int k=0;
int i;
	

scanf("%d %d",&a,&b);

for(k=a;k<b;k++)
{
for(i=2;i<k;i++)
{
if(k%i==0)
{
break;
}					
}
if(k==i)
{      
if(k%10==3)
{
printf("%d\n",k);
}				
}	
}
 return 0;
}
