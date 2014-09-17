#include <iostream>

using namespace std;

bool check_if_prosto(int);
int fib_nums(int);

int const ARRAY_SIZE = 10;

int main(){

	int x;
	
	cin >> x;

	if(x >= 10 || x <= 0){
		cout << "x ne e mejdy 10 i 0";
		return 0;
	}

	int nums_array[ARRAY_SIZE];

	for(int i = 1, m = 0; m < 2; i++){
		if(fib_nums(i) % 10 == x){
			nums_array[m++] = fib_nums(i);
		}
	}

	if(x % 2){
		for(int i = 2, m = 2; m < ARRAY_SIZE; i++){
			if(i % 10 == x && check_if_prosto(i)){
				nums_array[m++] = i;
			}
		}

		cout <<  "Purvite prosti chisla koito zavurshvat na x sa: ";
		for(int i = 2; i < ARRAY_SIZE; i++){
			cout << nums_array[i] << " ";		
		}
	}else{
		cout << "Nqma zavurshvashti prosti chisla na x";
	}

	cout << endl << "Purvite fib chisla koito zavurshvat na x sa: ";
	for(int i = 0; i < 2; i++){
		cout << nums_array[i] << " ";		
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

int fib_nums(int n){
	int fib_number = 1;
	for(int i = 0, m = 0; i < n; i++){
		int temp = fib_number;
		fib_number += m;
		m = temp;
	}
	return fib_number;
}
