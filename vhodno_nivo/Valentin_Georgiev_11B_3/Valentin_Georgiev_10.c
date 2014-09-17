#include<stdio.h>
	int main(void){

		int x, j, i, next, first, second;
		int arr[10];

		do{
        		scanf("%d", &x);
    		}while((x<=0) || (x>9));
		
		j=0;
		next=0;
		first=0;
		second=1;

		while(j<10){
			next=first+second; 
			second=first; 
			first=next;

        		if(next % x == 0) {
          		j++;
            		arr[j] = next; 
			} 
		}
		
	 	for(i = 1; i <= 10; i++) {
        		printf("%d\n", arr[i]);   
    		}

	return 0;
	}
