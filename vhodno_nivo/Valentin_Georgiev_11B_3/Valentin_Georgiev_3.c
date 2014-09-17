#include<stdio.h>

	int main(void){

		int x, y, i, is_prime;
	
		do{
			scanf("%d", &x);
			scanf("%d", &y);
		}while(x>y);
		
		for(x=0; x<=y; x++){
			is_prime=1;
			
			for(i=2; i<=x/2; i++)
				if((x%i)==0) is_prime=0;
				
		if((is_prime==1) && (x%10==3)) printf("%d\n", x);
		}
		
	return 0;
	}
