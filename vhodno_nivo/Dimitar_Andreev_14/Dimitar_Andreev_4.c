#include<stdio.h>
 
int main()
{
   int first = 0, second = 1, next, c;
   int x,y,i,c;
   
   printf("vavedete cqloto 4islo x\n");
   scanf("%d",&x);
   printf("vavedete cqloto 4islo y\n");
   scanf("%d",&y);
   
   while (x>=y)
        {
            printf("4isloto x trqbva da e po-malko ot 4isloto y");
            printf("vavedete cqloto 4islo x\n");
            scanf("%d",&n);
            printf("vavedete cqloto 4islo y\n");
            scanf("%d",&y);
        }
 
   for ( c = x ; c < y ; c++ )
   {
      printf("fibunachi za 4isloto %d\n",c);
      for ( i = 0 ; i < c ; i++ )
        {
          if ( i <= 1 )
		      {
		        next = i;
            printf("%d\n",next);
	        }
	        else
          {
            next = first + second;
            first = second;
					  second = next;
          }
        } 
      first=0;
      second=1;    
   }
   return 0;
}
