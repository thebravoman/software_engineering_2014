#include <iostream>
#include <cmath>

inline long long int Fib(int n){return ((pow(1 + sqrt(5), n) - pow(1 - sqrt(5), n))/(pow(2, n) * sqrt(5)));}

int main(int argc, char* argv[]){
    int x, y;
    x = y = 0;
    while(x >= y){
        std::cin >> x;
        std::cin >> y;
    }
    
    for(int i = x; i <= y; i++){
        long long int result = Fib(i);
        if(result >= 0){
            std::cout << result << std::endl;
        }
        else{
            std::cout << "Error: Value out of type range! Terminating..." << std::endl;
            break;
        }
    }
    return 0;
}
