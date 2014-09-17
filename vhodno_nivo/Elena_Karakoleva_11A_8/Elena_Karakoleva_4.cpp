/*4. Да се разработи програма, която изисква от потребителя да въведе две
целочислени числа, x и y, където x < y. Да се намерят и изведат всички числа на
Фибоначи в интервала [x, y].*/

#include <iostream>
using namespace std;

int main ()
{
    int x,y,ar[1000],i,j,k;
    cout<<"Enter X: ";
    cin>>x;
    cout<<"Enter Y: ";
    cin>>y;
if (x<y)
{

    ar[0]=1;
    ar[1]=1;

    for (i=2;i<y;i++)
      {
        ar[i]=ar[i-1]+ar[i-2];
      }
    for (k=(x-1);k<y;k++)
      {
        cout<<ar[k]<<endl;
      }
} else cout<<"Y is not greater than X";
}
