#include <iostream>
using namespace std;
int main() 
{
	int x, y, i, p, j;
	cout << "Enter x: ";
	cin >> x;
	cout << "Enter y(x<y): ";
	cin >>y;
	if (x > y)
	{
		swap(x, y);
	}
	for (i = x; i <= y; i++)
	{
		for(j = 2; j < i; j++)
		{
			if(i % j == 0)
			{
				p = 0;
				break;
			}
			else 
				p = 1;
			if(p == 1)
			{
				if (i % 10 == 3)
				{
					cout << i << endl;
					break;
				}
			}
		}

	}
}
