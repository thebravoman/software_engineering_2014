#include <iostream>
using namespace std;
int fib(int n)
{
	if (n <= 0) return 0;
	else if (n == 1) return 1;
	else return fib(n-1)+fib(n-2);	

}
int main() 
{
	int x, a[10], n, i, j = -1;
	cout << "Enter x(0<=x<10): ";
	cin >> x;
	while ((x<0) || (x>=10))
	{
		cout << "Invalid.Enter x: ";
		cin >> x;
	}
	a[9] = 0;
	for (i = 0; a[9] == 0; i++)
	{
		if(fib(i) % x == 0)
		{
			j++;
			a[j] = fib(i);
			cout << "Number: " << j+1 << endl;
			cout << a[j] << endl;
		}
	}
}
