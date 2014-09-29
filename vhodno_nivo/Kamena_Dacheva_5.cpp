#include <iostream>
#include <iomanip>
#include <math.h>

using namespace std;

int main()
{
	double a[10];
	int i, j;
	double x, y=0;
	bool bval;
	int end=10;
	double a[10], b;

	cout << "x= ";
    	cin >> x;

    	if (x > 10 || x < 0)
    	{
        	cout << "Error! Bad input! \a\n";
        	return 1;
    	}

    	for (i = 0; i < 10; i++)
    	{
        	ar[i] = cos(i);
		cout << ar[i] << setw(15);
    	}
    	cout << endl;

	do {
		for (j = 0; j < end; j++)
		{
			bval=false;
			for(i = 0;i < (end-1); i++)
			{
				if (a[i] < a[i+1])
				{
					swap(a[i], a[i+1]);
					bval = true;
				}
			}
		}
	} while(bval);

	cout << endl << endl;
	for (c = 0; c < end; c++)
	{
		cout << ar[c] << setw(15);
    	}
    	cout << endl;

return 0;
}
