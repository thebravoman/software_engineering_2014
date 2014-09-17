#include <stdio.h>
	void main ()
{ 
	int x,y,i,sum;
sum=0;

printf ("Vuvedi 1-voto chislo ");

	scanf ("%d",&x);

printf ("Vuvedi 2-roto chislo ");

	scanf("%d",&y);
  if (x>y) 
 printf ("ne moje");
else 
 for (i=x;i<=y;i++)
 {
 if (i%17==0) 
 sum=sum+i;
}
printf("%d",sum);
}
