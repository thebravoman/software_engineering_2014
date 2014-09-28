#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(){
	int x, i, z, arr[10], arr2[10];
	do {
		printf("Vuvedi X:");
		scanf("%d", &x);
	} while (x < 0 || x > 100);

	srand(time(NULL));

	for (i = 1; i <= 10; i++){
		do {
			z = rand() % 100
		} while (z < x)
		arr[i] = z;
	}

	for (i = 1; i <= 10; i++){
		if (arr[i] % 2 != 0) arr2[i] = arr[i]
	}

	for (i = 1; i <= 10; i++){
		printf("%d\n", arr2[i]);
	}
	
	return 0;
}