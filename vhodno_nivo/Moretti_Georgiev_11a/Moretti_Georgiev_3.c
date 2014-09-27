#include <stdio.h>

int main(){
	int x,y,counter1,counter2;
while(1){

printf("Enter the two numbers");
scanf("%d %d",&x,&y);
if(x<y){
	break;
}
}
for(counter1=x; counter1<y; counter1++){
	for(counter2 = counter1++; counter2<counter1; counter2++){
		if(counter1%counter2 == 0){
			break;
		}
		else{
			if(counter1%10 == 3){
				printf("%d | ", counter1);
			}
		}
	}
}
return 0;
}
