#include <stdio.h>

int main(){
	int x,y,z,sum = 0,counter1;
	while(1){
		printf("Enter the two numbers");
		scanf("%d %d",&x,&y);
		if(x<y){
			break;
		}
	}
	counter1 = x;
	z = x;
	while(1){
		sum = x+z;
		x=z;
		z=sum;
		if(sum>y){
			break;
		}
		printf("%d/", sum);
	}
	return 0;
}
