#include <iostream>

using namespace std;

bool check_if_prosto(int);

int const ARRAY_SIZE = 10;

int main(){

	int x;
	
	cin >> x;

	if(x % 2 == 0){
		cout << "Nqma zavurshvashti prosti chisla na x" << endl;
		return 0;
	}

	if(x >= 10 || x <= 0){
		cout << "x ne e mejdy 10 i 0";
		return 0;
	}

	int nums_array[ARRAY_SIZE];

	for(int i = 1, m = 0; m < ARRAY_SIZE; i++){
		if(check_if_prosto(i) && i % 10 == x){
			nums_array[m++] = i;
		}
	}

	cout << "Purvite prosti chisla koito zavurshvat na x sa: ";
	for(int i = 0; i < ARRAY_SIZE; i++){
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
