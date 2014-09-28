#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

int main()
{
    int x, i = 0, z, b = 0;
    double number, a[10];
    cout << "x= ";
    cin >> x;

    if ((x < 0) || (x >= 10))
    {
        cout << "Error! Bad input! \a\n";
        return 1;
    }

    while (b!=10)
    {
        number = cos(i);
        z = number*1000;
        if (z%10 == x)
        {
            a[b] = number;
            b++;
        }
        i++;
    }

    for (i = 0; i < 10; i++)
    {
        cout << a[i] << setw(10);
    }

    return 0;
}
