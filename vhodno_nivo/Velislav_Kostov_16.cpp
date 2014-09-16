#include <iostream>
#include <cmath>

inline bool even(int num){return(num % 2 == 0 ? true : false);}
int isPrime(int number){

    if(number < 2) return 0;
    if(number == 2) return 1;
    if(number % 2 == 0) return 0;
    for(int i=3; (i*i)<=number; i+=2){
        if(number % i == 0 ) return 0;
    }
    return 1;

}
/*
bool prime(int num){
    for(int i = 1; i < num; i++){
        if(num % i == 0){
            return false;
        }
    }
    return true;
}
*/

int main(int argc, char* argv[]){
    std::cout << isPrime(16) << std::endl;
    int x = -1;
    while(x < 0)
        std::cin >> x;
    
    int divisors[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    
    std::cout << "Divisors: ";
    for(int divCount = 0, i = 0; divCount < 10; i++){
        if(!even(i) && std::abs(x % i) == 0){
            divisors[divCount++] = i;
            std::cout << divisors[divCount - 1] << std::endl;
        }
    }
    
    std::cout << "Of which primes: ";
    for(int i = 0; i < sizeof(divisors)/sizeof(int); i++){
        if(isPrime(divisors[i])){
            std::cout << divisors[i] << std::endl;
        }
    }
    
    return 0;
}
