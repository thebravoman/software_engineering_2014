#include <iostream>
#include <cmath>

int main(int argc, char* argv[]){
    
    //It's impractical to use memset for 10 elements, isn't it ?
    double array[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    
    for(int i = 0; i < 10; i++){
        array[i] = cos(i);
        std::cout << array[i] << std::endl;
    }
    
    //Sort in decreasing order
    bool sorted = false;
    bool change = false;
    while(!sorted){
        change = false;
        for(int i = 0; i < 10; i++){
            if(array[i] < array[i + 1]){
                double temp = array[i + 1];
                array[i + 1] = array[i];
                array[i] = temp;
                change = true;
            }
        }
        if(!change)
            sorted = true;
    }
    
    std::cout << "Sorted: " << std::endl;
    
    //Print
    for(int i = 0; i < 10; i++){
        std::cout << array[i] << std::endl;
    }
    
    return 0;
}
