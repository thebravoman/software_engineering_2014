#include<iostream>
using namespace std;
int main(){

int x,y;
do{
    cin>>x>>y;
}while(x>y);
int sum=0;
for(int a=x;a<=y;a++){
    if(a%17==0){
        sum+=a;
    }

}
cout<<sum<<endl;






return 0;
}
