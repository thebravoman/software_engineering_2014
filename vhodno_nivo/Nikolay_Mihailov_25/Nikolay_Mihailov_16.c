#include<stdio.h>

int main(){
	int arr[10],x,i,l,loop,flag;
	
	do{
		scanf("%d",&x);
	
	}while(x<0 && x>9);


	for(i = 1,l = 0; l<10 ; ++i){
		flag=0;
      		for(loop=2; loop<=i/2; ++loop){
        		if(i%loop==0){
          		flag=1;
          		break;
        	}
	}
		if(flag==0 && i%10==x){
     		arr[l]=i;
		l++;
		}
  	}

	
	for(l = 0;l<10;l++) printf("%d\n",arr[l]);


	return 0;
}
