#include <iostream>

using namespace std;

int main()
{
    int x, y, sum = 0, i;
    bool b;

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
        for (i = 2; i < x; i++)
        {
            if (x%i == 0)
            {
                b = 1;
            }
        }

        if ((b==0) && (x%10==3))
        {
            sum+=x;
        }
        b = 0;
    }

    cout << "sum= " << sum;
    return 0;
}
