/* 2.	�� �� ��������� ��������, ����� ������� �� ����������� �� ������ ��� ����������� �����, x � y,
 ������ x < y. �� �� ������ � ������ ������ �� ������� ������ �� �� 17 � �������� [x, y].
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
