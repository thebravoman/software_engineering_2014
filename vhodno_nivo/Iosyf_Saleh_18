#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x;
    int i;
    int q;
    int flag=0;
    int counter=0;
    int *c;
    c = (int *)calloc(100,sizeof(int));
    scanf ("%d",&x);
    if (x>0)
    {
        for (i=1;i<x;i=i+2)
        {
            if (x%i==0)
            {
                c[counter]=i;
                printf("%d ", i);
                counter++;
                if (counter==10)
                    break;
            }
        }
    }
    printf("\n\n");
    for (i=0;i<counter;i++)
    {
        for(q=2;q<=c[i]/2;++q)
        {
            if(c[i]%q==0)
            {
                flag = 1;
                break;
            }
        }
        if (flag==0)
            printf("%d ", c[i]);
        else
            flag = 0;
    }
    return 0;
}
