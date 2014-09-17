#include<stdio.h>
 
int main()
{
   int x,y,i,c;
   i=0;
   
    printf("vavedete cqloto 4islo x\n");
    scanf("%d",&x);
    printf("vavedete cqloto 4islo y\n");
    scanf("%d",&y);
   
    while (x>=y)
        {
            printf("4isloto x trqbva da e po-malko ot 4isloto y");
            printf("vavedete cqloto 4islo x\n");
            scanf("%d",&x);
            printf("vavedete cqloto 4islo y\n");
            scanf("%d",&y);
        }

    for ( c = x ; c <= y ; c++ )
        {
            if (c%17==0)
            {
                i=i+c;
            }
        }
    printf("sumata na 4islata delq6tise na 17 e = %d",i);
    return 0;
}
