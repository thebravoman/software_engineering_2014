#include<stdio.h>

int main(){
	int arr[10],x,i,l,loop,flag;
	
	do{
		scanf("%d",&x);
	
	}while(x<0);

	for(i=1,l=0;l<10;i+=2){
		if(x%i==0){
		arr[l]=i;
		l++;
		}
		if(i>x/2) break;
	}
	
	for(loop = 0;loop<l;loop++) printf("%d\n",arr[loop]);
	
	printf("\n");

	for(i=0; i<l ; i++){
		flag=0;
      		for(loop=2; loop<=arr[i]/2; ++loop){
        		if(arr[i]%loop==0){
          		flag=1;
          		break;
        	}
	}
		if(flag==0){
     		printf("%d\n",arr[i]);
		}
  	}	


	return 0;
}
