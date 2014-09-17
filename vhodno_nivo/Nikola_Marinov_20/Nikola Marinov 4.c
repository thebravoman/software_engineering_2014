/* Zadacha 4*/
#include<stdio.h>
int main()
{
	int x,y,z,n,a=0,b=1,i;
	
	printf("First number x:\n");
	scanf("%d",&x);
	
	printf("Second number y bigger than x:\n");
	scanf("%d",&y);
	if ( y <= x )
	{
		printf("Another number x:\n");
	    scanf("%d",&x);
	    
		printf("Write another y bigger than x:\n");
	    scanf("%d",&y);
	}
for( i=x ; i<y ; i++  )
{
	printf("Chisla na fibonachi za intervala:\n");
	 for ( n = 0 ; n < i ; n++ )
        {
          if ( n <= 1 )
		      {
		        z = n;
            printf("%d\n",z);
	        }
	        else
          {
            z = a + b;
            a = b;
		    b = z;
          }
        }
		 a=0;
         b=1;
}
return 0;
}
