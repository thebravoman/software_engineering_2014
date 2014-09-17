/*7. Да се разработи програма, която изисква от потребителя да въведе целичислено
число х, където 0<x<100. Да се инициализира масив от 10 целочислени елемента,
всеки един >x. Всеки 2­ри елемент да се запише в нов масив с размер 5.
Полученият масив да се изведе на екрана*/

#include <cstdlib>
#include <ctime>
#include <iostream>
#include <algorithm>
using namespace std;
int main()
{
    int x,ar[10],a2[10],i,n=1,j;


do{
    cout<<"Enter X: ";
    cin>>x;
   }while(x<=0||x>=100);;
    srand((unsigned)time(NULL));

    for (int i = 0; i <10; i++)
      {
         ar[i] = x+ rand() % 100;
         cout << ar[i] << endl;
      }
cout<<"*******"<<endl;
   for (j=0;j<=5;j++)
   {
       a2[j]=ar[n];
       n=n+2;
   }

   for (j=0;j<5;j++)
   {
       cout<<a2[j]<<endl;
   }
}
