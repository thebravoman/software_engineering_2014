//0<x<10, v masiv ot 10 elementa vuv element N(1:10) da se
//zapishe i izvede sbora na chislata ot 0 do 1000, delqshti se na N*x

#include <stdio.h>

int main(){
    int x,
        i,
        i2,
        arr[10];

    do{
        scanf("%d", &x);
    }while(x>=10 | x<=0);

    int sumHolder;
    for(i=0; i<10; i++){
        sumHolder = 0;
        for(i2=0; i2<1000; i2++){
            if(i2%(x*(i+1)) == 0){
                sumHolder += i2;
            }
        }
        arr[i] = sumHolder;
    }

    for(i=0; i<10; i++){
        printf("%d\n", arr[i]);
    }

    return 0;
}
