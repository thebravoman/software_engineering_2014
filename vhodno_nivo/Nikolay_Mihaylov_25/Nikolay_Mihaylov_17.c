#include<stdio.h>

int main(){
	int arr[10],x,i,l,first,sec,result;
	
	do{
		scanf("%d",&x);
	
	}while(x<0 && x>9);
		
	first=1;	
	sec=1;
	result=2;
	for(i=0;i<10;){
		if(sec%10==x){
			arr[i]=sec;
			i++;
		}
		result=sec + first;
		first=sec;
		sec=result;
	}
	
	for(l = 0;l<10;l++) printf("%d\n",arr[l]);


	return 0;
}
