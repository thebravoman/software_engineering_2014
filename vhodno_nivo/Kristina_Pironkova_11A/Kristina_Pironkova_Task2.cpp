#include <iostream>

using namespace std;

int main(){

    int x;
    int y;
    int sum = 0;



    cout << "Enter x (x<y): ";
    cin >> x;

    do{
        cout << "Enter y (x<y): ";
        cin >> y;

    }while(x>=y);

    for(int i=x;i<= y; i++){
        if (i%17==0){
            sum+=i;
        }
    }
    cout << "The sum is: " << sum;

    return 0;

}







