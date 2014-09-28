#include <iostream>

using namespace std;

int main()
{
	int x, y, w, h, a[10], i=1, j=0, z, k;
	
	cout << "x= ";
	cin >> x;

	cout << "y= ";
	cin >> y;

	cout << "w= ";
	cin >> w;

	cout << "h= ";
	cin >> h;

    	if ((x <= 0) || (y <= 0) || (w <= 0) || (h <= 0))
    	{
        	cout << "Error! Bad input! \a\n";
        	return 1;
    	}
z = w;
k = h;
	while ((w <= y) && (h <= x))
	{
		a[i] = w;
		w = z + w;
		i++;

		h = k + h;
		j++;
	}
	cout << "i= " << i;

	for (i=0; i<=10; i++)
	{
		cout << a[i] << "\n";
	}	

return 0;
}
