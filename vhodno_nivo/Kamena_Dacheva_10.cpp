#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

int main()
{
    int x, i = 0, f,  b = 2, a = 1, myArray[10];

    cout << "x= ";
    cin >> x;

    if ((x < 0) || (x >= 10))
    {
        cout << "Error! Bad input! \a\n";
        return 1;
    }

    while (i!=10)
    {
        f = a + b;
        a = b;
        b = f;
        if (f%x == 0)
        {
            myArray[i] = f;
            i++;
        }
    }

    for (i = 0; i < 10; i++)
    {
        cout << myArray[i] << "\n";
    }

    return 0;
}
