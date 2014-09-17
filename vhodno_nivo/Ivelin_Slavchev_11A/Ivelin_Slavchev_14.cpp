#include <iostream>
using namespace std;
int main()
{
	int n = 1, x, c = 0, v = 0, s = 0, i = 0, a[10];
	cout << "Enter x: ";
	cin >> x;
	while ((x <= 0) || (x >= 10))
	{
		cout << "Invalid.Enter x: ";
		cin >> x;
	}
	while (c < 10)
	{
		
		if (n % x == 0)
		{
			for (i = 0; i <= n; i++)
			{
				s = s + i;
			}
			a[v] = s;
			v++;
			c++;
			s = 0;
		}
		n++;	
	}
	for (v = 0; v < 10; v++)
	{
		cout << a[v] << endl;;
	}
}
