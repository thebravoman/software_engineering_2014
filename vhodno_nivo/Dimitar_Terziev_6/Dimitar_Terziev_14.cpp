#include<iostream>
using namespace std;
int main () {
	unsigned long long sum_arr[10],curr_N=1;
	int x;
	cin>>x;
	if(x<0 || x>9){
		return 0;
	}
	for(int i=0;i<10;i++){
		sum_arr[i]=0;
	}
	for(int i=0;i<10;i++){
		while(curr_N%x!=0){
			sum_arr[i]+=curr_N;
			curr_N++;
		}
		curr_N++;
	}
	for(int i=0;i<10;i++){
		cout<<sum_arr[i]<<" ";
	}
	return 0;
}
