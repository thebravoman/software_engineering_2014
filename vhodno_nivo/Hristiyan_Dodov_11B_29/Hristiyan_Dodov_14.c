#include <stdio.h>

int main(){
    int x,
        i,
        i2,
        arr[10],
        numCounter = 0,
        loopNum = 0;

    do{
        scanf("%d", &x);
    }while(x>=10 | x<=0);

    while(numCounter<10){
        if(loopNum%x == 0){
            arr[numCounter] = loopNum;
            numCounter++;
        }
        loopNum++;
    }

    int sumHolder;
    for(i=0; i<10; i++){
        sumHolder = 0;
        for(i2=0; i2<=arr[i]; i2++){
            sumHolder += i2;
        }
        arr[i] = sumHolder;
    }

    for(i=0; i<10; i++){
        printf("%d\n", arr[i]);
    }

    return 0;
}
