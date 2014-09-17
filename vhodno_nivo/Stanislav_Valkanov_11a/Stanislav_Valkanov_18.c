#include <stdio.h>
void main()
{
	int i,x,p,g,arr[50];
	
	printf("vuvedete chislo");
	scanf("%d",&x);
	p=0;
	for(i=1;i<=x;i++){
		if((x%i == 0)&&(i%2 != 0)){
		    p++;
		    arr[p] = i;
		}
	}

	for(i=1;i<=p;i++){
		printf(" %d",arr[i]);
	}

	for(i=1;i<=p;i++){
	  		for(g = 2; g<arr[i]; g++){
				if ((arr[i]%g==0)&&(g!=1)&&(g!=arr[i]))
				{
					printf(" %dne e prosto",arr[i]);
				}
		
	  }
	  

}
}