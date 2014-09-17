/*8. Да се разработи програма, която изисква от потребителя да въведе целичислено
число х, където 0<x<100. Да се инициализира масив от 10 целочислени елемента,
всеки един >x. Всеки нечетен елемент да се запише в нов масив. Полученият масив
да се изведе на екрана.*/

#include <cstdlib>
#include <ctime>
#include <iostream>
#include <algorithm>
using namespace std;
int main()
{
    int x,ar[10],a2[10],i,n=-1,j=-1;


do{
    cout<<"Enter X: ";
    cin>>x;
   }while(x<=0||x>=100);
    srand((unsigned)time(NULL));

    for (int i = 0; i <10; i++)
      {
         ar[i] = x+ rand() % 100;
         cout << ar[i] << endl;
      }
cout<<"*******"<<endl;
   do
   {
    j++;
     if(ar[j]%2!=0)
     {
         n++;
         a2[n]=ar[j];
         cout<<a2[n]<<endl;

     }
   }while(j<9);
}
