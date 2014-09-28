#include <stdio.h>

int main(){
	int x, y, i, sum = 0;
	do {
		printf("Vuvedi 1-ro chislo:\n");
		scanf("%d", &x);
		printf("Vuvedi 2-ro chislo:\n");
		scanf("%d", &y);
	} while (x>y);
	for (i = x; i<= y; i++){
		if ((i % 17) == 0) sum+=i; 
	}
	printf("Sumata na chislata, delqshi se na 17: %d\n", sum);
	return 0;
}