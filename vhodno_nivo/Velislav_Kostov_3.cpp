#include <iostream>

inline int lastDigit(int num){return num % 10;}
inline bool endsWith(int num, int digit){return(lastDigit(num) == digit ? true : false);}

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
    int x, y;
    x = y = 0;
    while(x >= y){
        std::cin >> x;
        std::cin >> y;
    }
    
    for(int i = x; i <= y; i++){
        if(prime(i) && endsWith(i, 3))
            std::cout << i << std::endl;
    }
    return 0;
}
