/*1.	�� �� ��������� ��������, ����� ������� �� ����������� �� ������ ��� ����������� �����, x � y,
������ x < y. �� �� ������ ������ �� ������ ������� ����� � ��������� [x,y].
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
            if(a%2 != 0){
                printf(" %d", a);
            }
        }
    }


return 0;
}
