#include <iostream>
#include <math.h>
using namespace std;
int main ()
{
	int x, i, j;
	cout << "Enter x: ";
	cin >> x;
	while ((x<=0) || (x>=10))
	{
		cout << "Invalid.Enter x: ";
		cin >> x;
	}
	float a[x], s;
	cout << "Unsorted: " << endl;
	for (i = 0; i < x; i++)
	{
		a[i] = cos(i);
		cout << a[i] << endl;
	}
	cout << "Sorted: " << endl;
	for (i = 0; i < x - 1;i++)
	{
		for (j=(i+1);j<x;j++)
		{
			if (a[i]<a[j])
			{
				s = a[i];
				a[i] = a[j];
				a[j] = s;
			}
		}
	}
	for (i = 0; i < x; i++)
	{
		cout << a[i] << endl;
	}
}
