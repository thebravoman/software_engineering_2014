#include<stdio.h>

	int main(void){

		int x, y, next, first, second;
		
		do{
			scanf("%d", &x);
			scanf("%d", &y);
		}while(x>y);
		
		next=0;
		first=0;
		second=1;

		for(x; x<=y; x++){
			next=first+second; 
			second=first; 
			first=next;
			printf("%d\n", next);
		}
		
	return 0;
	}
