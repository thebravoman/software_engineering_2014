#include <iostream>

inline bool even(int num){return(num % 2 == 0 ? true : false);}

bool prime(int number){
    if(number < 2) return false;
    if(number == 2) return true;
    if(number % 2 == 0) return false;
    for(int i = 3; (i * i) <= number; i += 2){
        if(number % i == 0) return false;    
    }
    return true;
}

int main(int argc, char* argv[]){
    std::cout << prime(16) << std::endl;
    int x = -1;
    while(x < 0)
        std::cin >> x;
    
    int divisors[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    
    std::cout << "Divisors: ";
    //i must be less than x to acquire proper loop termination 
    //(and adequate divisors even less than 10) instead of inf loop
    for(int divCount = 0, i = 0; divCount < 10 && i <= x; i++){
        if(!even(i) && (x % i) == 0){
            divisors[divCount++] = i;
            std::cout << divisors[divCount - 1] << std::endl;
        }
    }
    
    std::cout << "Of which primes: ";
    for(int i = 0; i < sizeof(divisors)/sizeof(int); i++){
        if(prime(divisors[i])){
            std::cout << divisors[i] << std::endl;
        }
    }
    
    //If no primes were found still end the output, else and extra std::endl is added
    std::cout << std::endl;
    
    return 0;
}
