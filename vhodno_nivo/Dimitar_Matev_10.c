/* 8.	Да се разработи програма, която изисква от потребителя да въведе целочислено число x,
където 0<=x<10. Да се инициализира масив от 10 елемента. Да се намерят първите 10 числа на Фибоначи
в [0; +∞), които се делят на x без остатък. Намерените стойности да се зададат като стойности на
елементите в масива. Елементите на масива да се изведат на стандартния изход. */


#include <stdio.h>

int fibonachi(int num);


int main(){

    int x, i=0;
    long long a, arr[10];

    arr[9] = 0;

    printf("vuvedi chisloto na koeto shte delim\n");

    scanf(" %d", &x);


    printf("Chislata na Fibonachi koito se delqt na %d\n", x);
    for(a=0;; a++){

        if(fibonachi(a) && a%x==0){
            arr[i]= a;
            printf("%d -> %d\n", i, arr[i]);
            if(arr[9]!= 0){
                break;
            }
            i++;
        }


    }
   // for(i=0; i<=9; i++){
     //   printf("%d\n", arr[i]);
    //}


return 0;
}

int fibonachi(int num){

    int fib1 = 1;
    int fib2 = 1;

    while(fib2<num){
        fib2 += fib1;
        fib1 = fib2-fib1;
    }
    if (fib2 == num)
        return 1;

    return 0;
}
