#include <stdio.h>

int checkFoPrime(int x);

int main(){
    int x,
        i,
        arr[10],
        primes[10],
        numCounter = 0,
        loopNum = 0;

    for(i=0; i<10; i++){
        arr[i] = 0;
    }

    do{
        scanf("%d", &x);
    }while(x<0);

    //find 10 numbers & store
    while(numCounter<10){
        loopNum++;
        if(loopNum%2 == 1 && x%loopNum == 0){
            arr[numCounter] = loopNum;
            numCounter++;
        }
        if(loopNum>x){
            numCounter = 10; //escape loop
        }
    }

    //check for primes
    int primeArrPos = 0;
    for(i=0; i<10; i++){
        if(checkFoPrime(arr[i])){
            primes[i] = arr[i];
            primeArrPos++;
        }
    }

    //print all numbers
    printf("All: ");
    for(i=0; i<10; i++){
        if(arr[i] != 0){
           printf("%d ", arr[i]);
        }
    }

    //print prime numbers
    printf("\nPrimes: ");
    for(i=0; i<primeArrPos; i++){
        printf("%d ", primes[i]);
    }

    return 0;
}

int checkFoPrime(int x){
    int i;

    //0 not a prime yo
    if(x == 0){ return 0; }

    for(i=2; i<x; i++){
        if(x%i == 0){
            return 0;
        }
    }

    return 1;
}
