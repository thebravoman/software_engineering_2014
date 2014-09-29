#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

int main()
{
    int i = 1, j = 1;
    double x, pi = 0.00;

    cout << "x= ";
    cin >> x;

    if (x > 1 || x < 0)
    {
        cout << "Error. Bad input! \a\n";
        return 1;
    }

    while (4/i >= x)
    {
        if (j%2 == 0)
        {
            pi = pi + 4/i;
        }
        if (j%2 != 0)
        {
            pi = pi - 4/i;
        }
        i+=2;
        j++;
    }

    cout << pi << endl;
    return 0;
}
