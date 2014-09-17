#include <iostream>
#include <cstdlib>
using namespace std;
int main()
{
	int x,a[100],i,j,s;
	cout << "Enter x: ";
	cin >> x;
	while ((x<=0) || (x>=10))
	{
		cout << "Invalid.Enter x: ";
		cin >> x;
	}
	for (i = 0; i < 100; i++)
	{
		a[i] = rand()%100;
		cout << a[i] << endl;
	}			
	cout << "Sorted: " << endl;
	for(i = 0;i < 99;i++)
	{
		for(j = (i + 1); j < 100; j++)
		{
			if (a[i] % 10 == x)
			{
				s = a[i];
				a[i] = a[j];
				a[j] = s;	
			}
		}
	}
	for(i = 99; i>0; i--)	
		cout << a[i] << endl;
}
