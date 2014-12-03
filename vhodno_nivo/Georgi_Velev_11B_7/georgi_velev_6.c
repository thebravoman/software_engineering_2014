#include <stdio.h>
#include <stdlib.h>

int main(void) {
	
	int x, i = 0, temp, lock_save = 0;
	
	int array[100];
	
	scanf("%d", &x);
	
	for(i = 0; i < 100; i++)
		array[i] = rand() % 100;
		
	for(i = 0; i < 100; i++)
		if((array[i] % 10) == x)
		{
			temp = array[lock_save];
			array[lock_save] = array[i];
			array[i] = temp;
			lock_save++;
		}
			
	for(i = 0; i < 100; i++)
		printf("%d ", array[i]);
	
	return 0;
}
