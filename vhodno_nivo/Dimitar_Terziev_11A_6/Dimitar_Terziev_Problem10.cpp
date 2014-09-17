#include<iostream>
using namespace std;
int main () {
	long long fib_1=1,fib_2=1,fib_array[10];
	int x=0,i=0;
	bool l=0;
	cin>>x;
	while(i<9){
		if(l){
			fib_1+=fib_2;
			if(fib_1%x==0){
				fib_array[i]=fib_1;
				i++;
			}
		}else{
			fib_2+=fib_1;
			if(fib_2%x==0){
				fib_array[i]=fib_2;
				i++;
			}
		}
		l=!l;
	}
	for(int i=0;i<10;i++){
		cout<<fib_array[i]<<" ";
	}
	return 0;
}
