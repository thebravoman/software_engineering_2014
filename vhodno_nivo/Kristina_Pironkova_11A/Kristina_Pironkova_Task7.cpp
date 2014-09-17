#include <iostream>
#include  <cstdlib>
using namespace std;

int main()
{

    int x;
    int j=0;
    int arr[10];
    int arr2[5];

    do{
        cout << "Enter x: ";
        cin >> x;
    }while((x<0 || x>100));

    for(int i=0; i<10 ; i++){
      do{
        cout << "Enter " << i << " element: " << endl;
        cin >> arr[i];
      }while(arr[i]<=x);

    }
    cout << "The new array is: ";
    for(int i=0; i<5; i++){
        arr2[i]=arr[j];
        j+=2;
        cout << arr2[i] << "|";
    }


    return 0;
    }






