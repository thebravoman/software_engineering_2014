#include <iostream>

using namespace std;

int main()
{
    int x;
    int y;
    int f3=1,f2=1,f1=0;

    cout << "Enter x: ";
    cin >> x;

    do{
        cout << "Enter y: ";
        cin >> y;

    }while(x>=y);

    for(int i=x; i<=y ; i++){
        if((f3>=x) && (f3<=y)){
           cout << f3 << endl;
        }
        f3=f1+f2;
        f1=f2;
        f2=f3;
    }


    return 0;
}
