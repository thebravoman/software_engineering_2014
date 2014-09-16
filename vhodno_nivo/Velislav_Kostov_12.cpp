#include <iostream>

/* sum[+x,+y] */
int sumPositiveInterval(int start, int end){
    int sum = 0;
    if(start > end)
        std::swap(start, end);
    for(; start <= end; start++)
        sum += start;
    return sum;
}

int main(int argc, char* argv[]){
    int x = 0;
    while(!(x > 0 && x < 10))
        std::cin >> x;
    int array[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    
    for(int element = 0, n = 0; element < (sizeof(array)/sizeof(int)); element++){
        for(int counter = 0; ; counter++){
            //'counter' must be greater than 'n' 
            //in order to acquire the next divident in the interval
            if((counter % x == 0) && (counter > n)){
                n = counter;
                array[element] = sumPositiveInterval(0, n);
                break;
            }
        }
    }
    
    /*
    for(auto e : array) //ranged for loop (-std=c++11)
        std::cout << e << std::endl;  
    */
    for(int i = 0; i < (sizeof(array)/sizeof(int)); i++)
        std::cout << array[i] << std::endl;
    return 0;
}
