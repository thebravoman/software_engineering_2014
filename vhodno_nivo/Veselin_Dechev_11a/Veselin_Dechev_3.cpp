#include<iostream>
using namespace std;
int main(){

int x,y;
do{
    cin>>x>>y;
}while(x>y && x<2);

for(int a=x;a!=y+1;a++){

    bool da=true;
    for(int b=2;b!=a;b++){

        if(a%b==0 ){
            da=false;

        }
    }
    if(da==true && a%10==3){
        cout<<a<<endl;
    }
}

return 0;
}
