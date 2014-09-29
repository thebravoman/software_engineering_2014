#include <iostream>

using namespace std;

int main()
{
    int x, y, sum = 0;

    cout << "x= ";
    cin >> x;

    cout << "y= ";
    cin >> y;

    if (x>y)
    {
        cout << "Error! Bad input! \a\n";
        return 1;
    }

    for (x; x <= y; x++)
    {
        if (x%17==0)
        {
            sum+=x;
        }
    }

    cout << "sum= " << sum;
    return 0;
}
