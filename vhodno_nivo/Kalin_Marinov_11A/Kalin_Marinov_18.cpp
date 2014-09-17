#include <iostream>

using namespace std;

int const DIVISORS = 10;

bool check_if_prosto(int);
int main(){

	int x;
	cin >> x;
	if(x < 0){
		cout << "x e po-malko ot 0\n";
		return 0;
	}

	int first_odd_divisors_x[DIVISORS];

	for(int count = 0, i = 1; count < DIVISORS; i+=2){

		if(i > x){
			cout << "x nqma " << DIVISORS << " deliteli\n";
			return 0;
		}		

		if(!(x % i)){
			first_odd_divisors_x[count] = i;
			count++;
		}	
	}

	for(int i = 0; i < DIVISORS; i++){
		cout << first_odd_divisors_x[i] << " ";
	}

	cout << endl << "Prostite chisla sa: ";

	for(int i = 0; i < DIVISORS; i++){
		if(check_if_prosto(first_odd_divisors_x[i]))
			cout << first_odd_divisors_x[i] << " ";
	}

	return 0;
}

bool check_if_prosto(int num){
	for(int i = 2; i < num/2; i++){
		if(!(num % i))
			return false;
	}	
	
	return true;
}
