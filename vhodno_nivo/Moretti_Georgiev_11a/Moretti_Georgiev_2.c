#include<stdio.h>

int main(){
	int x,y,i,sum=0;
	while(1){
		printf("Enter the two numbers");
		scanf("%d %d", &x,&y);
		if(x<y){
			break;
		}
	}
	for(i=0; i<y; i++){
		if(i%2==0){
			sum += i;
		}
	}
	printf("Sum: %d", sum);
	return 0;
}
