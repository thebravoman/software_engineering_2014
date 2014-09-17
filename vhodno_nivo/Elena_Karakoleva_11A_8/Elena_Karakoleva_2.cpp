/*2.Да се разработи програма, която изисква от потребителя да въведе две
целочислени числа, x и y, където x < y. Да се намери и изведе сумата на числата
делящи се на 17 в интервал [x, y].*/

#include <iostream>
using namespace std;

int main()
{
    int x,y,i;
    float sm=0;


    cout<<"Enter X:";
    cin>>x;
    cout<<"Enter Y:";
    cin>>y;
if (x<y)
  {
    for (i=x;i<=y;i++)
    {
        if (i%17==0)
        {
            sm+=i;
        }
    }
     cout<<"The sum of the numbers that are divisible by 17 is: "<<sm<<endl;
  }
else cout<<"Y is not greater than X"<<endl;

}

