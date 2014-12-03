#include <stdio.h>

int main() {
	
	long int i, divs = 0;
	long int dividers[10];
	long int x, divider = 2;
	
	scanf("%ld", &x);
	
	while(divs < 10)
	{
		if((x % divider) == 0 && (divider & 1) == 1 )
			dividers[divs++] = divider;
		divider++;
		if(divider == x)
			break;
	}
	
	divider = 0;
	
	for(i = 0; i < 10; i++)
		printf("%ld ", dividers[i]);
	
	printf("\n");
	
	for(i = 0; i < 10; i++)
	{
		for(divs = 2; divs <= dividers[i]; divs++)
			if(dividers[i] % divs == 0)
				break;
		if(dividers[i] == divs)
			printf("%ld ", dividers[i]);
		divider = 0;
	}
	
	return 0;
}
