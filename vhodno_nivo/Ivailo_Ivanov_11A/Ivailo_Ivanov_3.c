#include <stdio.h>
int main(){
int x,y,i, i1;
while(1){
	printf("Two numbers? ");
	scanf("%d %d",&x,&y);
		if(x<y){
			break;
		}
	}
for(i=x; i1<y; i++){
	for(i1 = 2; i1<i; i1++){
		if(i%i1 == 0){
			break;
		}
	}	
	if(i%10 == 3){
		printf("%d | ", i);
	}	
}
printf("\n");
return 0;
}
