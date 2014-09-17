#include "stdio.h"
void main()
{
int x,i,g,p,opp[100];
printf("vuvedete chislo");
scanf("%d",&x);
if (x>=10)
{ ((printf("vuvedete chislo <10"))&&(x=0)&&(scanf("%d",&x))); }
opp[0]=1;opp[1]=1;g=0;
for(i=2;g<10;i++)
    {
	opp[i]=opp[i-1]+opp[i-2];
	if (opp[i]%x==0)
	{  
	    g++;
	    opp[g]=opp[i];
	}
    }
for(i=1;i<=g;i++)
{
    printf(" %d",opp[i]); 
}
}
