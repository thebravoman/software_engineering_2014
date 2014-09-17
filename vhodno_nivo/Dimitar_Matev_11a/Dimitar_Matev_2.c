/* 2.	Да се разработи програма, която изисква от потребителя да въведе две целочислени числа, x и y,
 където x < y. Да се намери и изведе сумата на числата делящи се на 17 в интервал [x, y].
*/

#include <stdio.h>

int main()
{

    int a, x, y;
    printf("Type the value of x and y\n");
    scanf(" %d", &x);
    scanf(" %d", &y);

    if(x < y){
        for(a = x; a <= y; a++){
            if(a%17 == 0){
                printf(" %d", a);
            }
        }
    }


return 0;
}
