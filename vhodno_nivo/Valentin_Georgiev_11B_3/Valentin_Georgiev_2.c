#include<stdio.h>

	int main(void){

		int x, y;
		int sum=0;

		do{
			scanf("%d", &x);
			scanf("%d", &y);
		}while(x>y);
		
		for(x=0; x<=y; x++){
			if(x%17==0)
			sum=sum+x;
		}

		printf("%d\n", sum);

	return 0;
	}
