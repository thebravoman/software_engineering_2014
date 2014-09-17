#include <stdio.h>
void main()
{
    int x,y,i,p;
    printf("vuvedete chislo");
    scanf("%d",&x);
    printf("vuvedete vtoro chislo");
    scanf("%d",&y);
    if (x>=y){
	printf("vuvedete chislo po malko ot sledvashtoto");
    scanf("%d",&x);
    printf("vuvedete vtoro chislo");
    scanf("%d",&y);
    }
    for(i=x;i<y;i++){
	if (i%17==0){
	    p=p+i;
	}
    }
    printf("%d",p);

}
