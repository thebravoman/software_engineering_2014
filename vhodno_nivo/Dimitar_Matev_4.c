/* 4.	Да се разработи програма, която изисква от потребителя да въведе две целочислени числа, x и y,
където x < y. Да се намерят и изведат всички числа на Фибоначи в интервала [x, y]. */

#include <stdio.h>

int fibonachi(int num);

int main(){

    int x, y, a;

    printf("Fibonachi ot x do y\n");
    scanf(" %d %d", &x, &y);

    printf("Chislata na Fibonachi w intervala[x;y]\n");
    for(a=x; a<=y; a++){

        if(fibonachi(a)){
            printf("%d\t", a);
        }

    }

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
