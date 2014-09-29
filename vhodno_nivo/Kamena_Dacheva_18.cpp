#include <iostream>
#include <iomanip>

using namespace std;

int main()
{
    int x, i = 0, a[11], j = 1, z;

    cout << "x= ";
    cin >> x;

    	if (x < 0)
    	{
        	cout << "Error! Bad input! \a\n";
        	return 1;
    	}

	while (i < 10) {
		if (j % 2 != 0)
        	{
			if (x % j == 0)
			{
            			a[i] = j;
				i++;
			}
        	}
		j++;
	}  

	for (i=0; i<10;i++) cout << a[i] << " ";
	cout << endl;

 return 0;
}
