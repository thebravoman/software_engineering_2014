#include <iostream>
using namespace std;
int main() 
{
	long int fib1 = 0, fib2 = 1, fib3 = 0;
	int x, y, i;
	cout << "Enter x: ";
	cin >> x;
	cout << "Enter y: ";
	cin >> y;
	if (x > y)
		swap(x, y);
	for (i = x; i <= y; i++)
	{
		if (fib3 <= y)
		{
			if (fib3 >= x)
			{
				cout << fib3 << endl;
			}
			fib1 = fib2;
            fib2 = fib3;
            fib3 = fib1+fib2;
        }
	}
}
