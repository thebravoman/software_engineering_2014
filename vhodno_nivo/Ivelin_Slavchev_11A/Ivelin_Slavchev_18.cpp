#include <iostream>
using namespace std;
int main() 
{
	int a[10], n = 1, i, j = 0, f;
	long int x;
	cout << "Enter x: ";
	cin >> x;
	while (x < 0)
	{
		cout << "Invalid.Enter x: ";
		cin >> x;
	}
	cout << "Divisors:" << endl;
	for (i = 0; j < 10; i++)
	{
		if (x % n == 0)
		{
			a[j] = n;
			cout << a[j] << endl;
			j++;
		}
		n = n + 2;
	}
	cout << "Prime divisors: " << endl;
	for (j = 1; j < 10;j++)
	{
		f = 0;
		for (i = 2;i < a[j]; i++)
		{
			if (a[j] % i == 0)
			{
				f = 1;
				break;
			}
		}
		if	(f == 0)
		{
			cout << a[j] << endl;	
		}
	}
}
