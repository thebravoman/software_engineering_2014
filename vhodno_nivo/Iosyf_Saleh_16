#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x;
    int *c;
    c= (int *)calloc(10,sizeof(int*));
    int y=0;
    int i=11;
    int q;
    printf("\nx= ");
    do
        scanf ("%d",&x);
    while ((x<=0) || (x>10));
    while (y!=10)
    {
        q=i;
        do
        {
            q=q-10;
        }
        while(q>10);
        if (q==x)
        {
            c[y]=i;
            printf("%d ", c[y]);
            y++;
        }
        i++;
    }
    return 0;
}
