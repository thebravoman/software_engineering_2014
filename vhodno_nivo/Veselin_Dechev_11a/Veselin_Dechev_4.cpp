#include<iostream>
using namespace std;
int main(){


int x,y,first=0,second=1,next;

do{
    cin>>x>>y;
}while(x>y && x<=0);

   for (int a=0;a!=y+1;a++){
      if (a<=1){
         next=a;
      }else{
         next = first + second;
         first = second;
         second = next;
      }

        if(a>x-1){
        cout<<next<<endl;
        }

   }

















return 0;
}
