#include <stdio.h>

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
	int previousNumber = 0;
	int currentNumber = 1;
	int nextNumber = previousNumber + currentNumber;
	
	do{
		if (numEndsIn(currentNumber,number) == 0){
	 		array[arrayIndex] = currentNumber;
	 		arrayIndex++;
	 	}
		 previousNumber = currentNumber;
		 currentNumber = nextNumber;
		 nextNumber = previousNumber + currentNumber;
		 
	}while(arrayIndex <= 9);
	
	for (i = 0; i < 10; i++){		
		printf ("%d ", array[i]);
	}
	
	printf ("\n");
	
	return 0;
}


int numEndsIn(int number,int secondNumber){		//ends->0 doesnt end->1
	if (number % 10 != secondNumber){
		return 1;
	}
		return 0;
		
}
