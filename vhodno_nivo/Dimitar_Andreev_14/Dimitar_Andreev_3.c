#include<stdio.h>
 
int main()
{
   int x,y,i,c,b;
   b=0;
   
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
    printf("4islata zavar6va6ti na 3 v intervala [x,y] sa:\n  ");
    for ( c = 1 ; c <= y ; c++ )
        {
            b=c%10;
            if(b==3)
            {
                printf("%d",c);
            }
        }
    return 0;
}
