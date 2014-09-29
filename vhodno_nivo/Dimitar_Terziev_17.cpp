#include<iostream>
using namespace std;
int main () {
	int x=0;
	unsigned long long fib_arr[10],fib_1=1,fib_2=1;
	bool l=0;
	cin>>x;
	if(x<0 || x>9){
		return 0;	
	}
	for(int i=0; i<10; i++){
		while(1){
			l=!l;
			if(l){
				fib_1+=fib_2;
				if(fib_1%10==x){
					fib_arr[i]=fib_1;
					break;
				}
			}else{
				fib_2+=fib_1;
				if(fib_2%10==x){
					fib_arr[i]=fib_2;
					break;
				}
			}
		}
	}
	for(int i=0; i<10; i++){
		cout<<fib_arr[i]<<" ";
	}
	return 0;
}
