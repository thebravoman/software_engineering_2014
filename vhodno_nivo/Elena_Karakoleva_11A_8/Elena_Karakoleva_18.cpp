/*18. Да се разработи програма, която изисква от потребителя да въведе целочислено
число x, където x e интервала [0; +∞). Да се намерят първите 10 нечетни числа
делители на x и да се запишат в масив. Масивът да се изведе на екрана и да се
намерят простите числа в този масив.*/

#include <iostream>
using namespace std;

int main()
{
    int ar[10];
    int x,a=0,h=0,k,j=0,b,g,m;
   do{
    cout<<"Enter x>0  :";
    cin>>x;
   }while(x<0);
int i=0;
    do
      {
          i++;
         if (i%2!=0)
          {
            if(x%i==0)
              {
                j++;
                h++;
                for (k=h;k<=h;k++)
                 {
                     ar[k]=i;
                     cout<<ar[k]<<endl;
                     b=ar[10];
                 }
              }
           }
       }while(j<10);
       if (j==0) cout<<"No odd number, which is divisible by: "<<x<<""<<endl;



    for (g=0;g<10;g++)
    {
       for(m=2;m<=b;m++)
       {
           if(ar[g]%m == 0)
            {  if (m!=ar[g]) break;
               cout<<""<<endl;
               cout<<"Simple numbers: "<<ar[g]<<endl;
               a++;
            }
       }
    }
    if (a==0)
     {
        cout<<""<<endl;
        cout<<"There are no simple numbers:"<<endl;
     }
 }

