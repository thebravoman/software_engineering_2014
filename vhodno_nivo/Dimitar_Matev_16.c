/* 14.	Да се разработи програма, която изисква от потребителя да въведе целочислено число x,
 където 0<x<10. Да се инициализира масив от 10 елемента. Да се намери първото просто число в
 интервала [0; +∞) завършващо на x и да се запише като първи елемент в масива. Да се намери
  второто просто число в интервала [0;  +∞) завършващо на x и да се запише като втори елемент
  в масива. Аналогично да се намерят първите N прости числа в интервала [0;  +∞) и да се запишат
   като елемент N в масива. Масивът да се изведе на стандартния изход. */

#include <stdio.h>

int prime(int n);

int main (){

    int arr[10], x, i, N, a=0, num= 0, count;

    do{
        scanf(" %d", &x);
    }while(x<0 && x>10);
    printf("\n\n");

    for(i=0; i<=9; i++){

        for(N=a;;N++){

            if(N%10==x && prime(N)){

                arr[i]= N;
                a= N+ 1;
                break;
            }

        }
        printf("%d -> %d\n",i ,arr[i]);
    }




return 0;
}

int prime(int n){
  int i, flag=0;

  for(i=2;i<=n/2;++i)
  {
      if(n%i==0)
      {
          flag=1;
          break;
      }
  }
  if (flag==0)
      return 1;
  else
  return 0;
}
