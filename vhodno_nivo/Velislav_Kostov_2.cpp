#include <iostream>

int main(int argc, char* argv[]){
    int x, y;
    x = y = 0;
    
    while(x >= y){
        std::cin >> x;
        std::cin >> y;
    }
    
    for(int i = x; i <= y; i++)
        if(i % 17 == 0)
            std::cout << i << std::endl;
    return 0;
}
