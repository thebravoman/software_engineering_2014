#include <iostream>
#include <iomanip>

using namespace std;

int main()
{
    int x, y, k, f=0, a=1, b=2;

    cout << "x= ";
    cin >> x;

    cout << "y= ";
    cin >> y;

    if (x > y)
    {
        cout << "Error! Bad input! \a\n";
        return 1;
    }

    for (k = 1; k <= y; k++)
    {
        f = a + b;
        a = b;
        b = f;
        if ((f >= x) && (f <= y)) cout << setw(5) << f;
    }
    return 0;
}
