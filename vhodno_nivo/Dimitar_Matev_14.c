/* 12.	Да се разработи програма, която изисква от потребителя да въведе целочислено число x,
където 0<x<10. Да се инициализира масив от 10 елемента. Да се намери първото число N в интервала
 [0; +∞) делящо се на х. Да се намери сумата на всички числа в интервала [0; N] и да се запише
  като първи елемент в масива. Да се намери второто число N' в интервала [0; +∞) делящо се на x.
  Да се намери сумата на всички числа в интервала [0, N'] и да се запише като втори елемент в масива.
  Аналогично да се запълнят и останалите елементи на масива. Масивът да се изведе на стандартния изход. */


#include <stdio.h>


int main (){

    int arr[10], x, i, N, a=0, num= 0, count;

    do{
        scanf(" %d", &x);
    }while(x<0 && x>10);
    printf("\n\n");

    for(i=0; i<=9; i++){

        for(N=a;;N++){

            if(N%x==0){

                for(count=0; count<=N; count++){

                    num+= count;
                }
                arr[i]= num;
                a= N+ 1;
                break;
            }

        }
        printf("%d -> %d\n",i ,arr[i]);
    }




return 0;
}
