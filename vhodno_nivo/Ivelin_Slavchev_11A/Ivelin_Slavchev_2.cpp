#include <iostream>
using namespace std;
int main()
{
	int x, y, s = 0;
	cout << "Enter x: ";
	cin >> x;
	cout << "Enter y: ";
	cin >> y;
	if (x > y)
		swap(x, y);
	for (x; x <= y; x++)
	{
		if (x % 17 == 0)
			s = s + x;
	}
	cout << "Value: " << s;
}
