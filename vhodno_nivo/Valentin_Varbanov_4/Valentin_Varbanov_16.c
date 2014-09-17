#include <stdio.h>

int isPrime(int);
int numEndsIn(int,int);

int main()
{
	int number = -1;
	while ((number < 0) || (number > 10)){
		scanf("%d", &number);
	}
	
	int array[10];
	int i = 1;
	int arrayIndex = 0;
	
	do{
		//printf("%d ",i);
		 if (isPrime(i) == 0){
		 	if (numEndsIn(i,number) == 0){
		 		array[arrayIndex] = i;
		 		arrayIndex++;
		 	}
		 }
		 i++;
	}while(arrayIndex <= 9);
	
	for (i = 0; i < 10; i++){		
		printf ("%d ", array[i]);
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

int numEndsIn(int number,int secondNumber){		//ends->0 doesnt end->1
	if (number % 10 != secondNumber){
		return 1;
	}
		return 0;
		
}
