#include<stdio.h>

int main(){
int x, y,sum = 0;
while(1){
printf("Enter the numbers: ");
scanf("%d %d", &x,&y);
if(x<y){
break;
}
}
for(x;x<y;x++){
	if(x%17 == 0){
		sum += x;
	}
}

printf("%d\n", sum);
return 0;
}
