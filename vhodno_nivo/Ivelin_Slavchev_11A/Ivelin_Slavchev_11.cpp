#include <iostream>
#include <iomanip>
using namespace std;
int main()
{
	int op = 0;
	double x, p = 4, n = 3;
	cout << "Enter x(0<x<1): ";
	cin >> x;
	while ((x <= 0)	|| (x >= 1))
	{
		cout << "Invalid.Enter x:";
		cin >> x;
	}
	do
	{
		if (op % 2 == 0)
		{
			p = p - (4 / n);
			op++;
			n = n + 2;
		}
		else 
		{
			p = p + (4 / n);
			op++;
			n = n + 2;
		}
	}
	while ((4 / n) >= x);
cout.precision(10);		
cout << p;
}
