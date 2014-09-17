#include <stdio.h>

int isPrime(int);

int main()
{
	int number = -1;
	while (number < 0){
		scanf("%d", &number);
	}
	
	int array[10];
	int i;
	int arrayIndex = 0;
	
	for (i = 1; i <= number; i +=2){
		if (number % i == 0){
			array[arrayIndex] = i;
			arrayIndex++;
		}
		if (arrayIndex > 9){
			break;
		}
	}
	if (arrayIndex < 9){
		for (i = arrayIndex; i < 10; i++){
			array[arrayIndex] = 0;
			arrayIndex++;
		}
	}
	
	for (i = 0; i < 10; i++){
		if (array[i] != 0){
			printf ("%d ",array[i]);
		}
	}
	
	printf ("\nPrime numbers: ");
	
	for (i = 0; i < 10; i++){
		if (isPrime(array[i]) == 0){
			if (array[i] != 0){
				printf ("%d ", array[i]);
			}
		}
	}
	printf ("\n");
	
	return 0;
}

int isPrime(int number){			//prime->0 not prime->1
	int i;
	for (i = 2; i < number; i++){
		if ((number % i == 0) && (i != number)){
			return 1;
		}
	}
	
	return 0;
}
