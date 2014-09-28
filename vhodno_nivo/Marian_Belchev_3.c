#include <stdio.h>

int main(){
	int x, y, i, z;
	do {
		printf("Vuvedi 1-ro chislo:\n");
		scanf("%d", &x);
		printf("Vuvedi 2-ro chislo:\n");
		scanf("%d", &y);
	} while (x>y);
	for (i = x; i<= y; i++){
		z = i % 10;
		if (z == 3) printf("%d\n", i); 
	}
	return 0;
}