#include<iostream>
using namespace std;
int main () {
	long long x=0,fact_arr[10],counter=1;
	cin>>x;
	if(x<0){
		return 0;
	}
	for(int i=0; i<10; i++){
		while(1){
			if(x%counter==0){
				fact_arr[i]=counter;
				break;
			}
			counter+=2;	
		}
	}
	for(int i=0;i<10;i++){
		cout<<fact_arr[i]<<" ";
	}
	cout<<"\n";
	for(int i=0;i<10;i++){
		if(fact_arr[i]%2!=0 || fact_arr[i]%5!=0){
			for(int l=3;l<fact_arr[i]/2;l+=2){
				if(fact_arr[i]%l==0){
					break;
				}
				if((l+2)>fact_arr[i]/2){
					cout<<fact_arr[i]<<" ";
					break;
				}
			}
		}
	}
	return 0;
}
