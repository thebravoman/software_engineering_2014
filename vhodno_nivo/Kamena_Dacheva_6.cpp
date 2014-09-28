#include <iostream>
#include <stdlib.h>
#include <iomanip>

using namespace std;

int main()
{
    int x, a[100], number, i, m=0, b;
    cout << "x= ";
    cin >> x;

    for (i = 0; i < 100; i++)
    {
        number = rand()%100;
        a[i] = number;
    }

    cout << endl;
    for (i = 0; i < 100; i++)
    {
        if (a[i]%10 == x)
        {
            b = a[i];
            a[i] = a[m];
            a[m] = b;
            m++;
        }
    }

    for (i = 0; i < 100; i++)
    {
        cout << a[i] << setw(5);
    }

    return 0;
}
