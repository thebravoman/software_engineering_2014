#include<iostream>
using namespace std;
int main () {
	double x=0,sum=0,ricep=1;
	long long twin_pr=1;
	bool check=0;
	cin>>x;
	if(x<0 || x>1){
		return 0;
	}
	while(1){
		for(int i=3; i<(twin_pr+2)/2; i+=2){
			if(twin_pr%i==0 || (twin_pr+2)%i==0){
				break;
			}
			if((i+2)>(twin_pr+2)/2){
				cout<<twin_pr<<"\n";
				check=1;
				break;
			}
		}
		if(check || twin_pr==1){
			double tw_pr=twin_pr;
			ricep=((double)1/(double)(twin_pr))+((double)1/(double)(twin_pr+2));
			if(ricep<x){
				break;
			}
			sum+=ricep;
		}
		twin_pr+=2;
	}
	cout<<sum;
	return 0;
}
