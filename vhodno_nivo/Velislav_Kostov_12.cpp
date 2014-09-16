#include <iostream>

int main(int argc, char* argv[]){
    int x, y, w, h;
    x = y = w = h = 0;
    while(!((x > 0 && y > 0) && (w > 0 && h > 0))){
        std::cin >> x;
        std::cin >> y;
        std::cin >> w;
        std::cin >> h;
    }
    int rectangleArea = x * y;
    int sampleArea = w * h;
    int slices = rectangleArea / sampleArea;
    
    std::cout << "Slices: " << slices << std::endl;
    if(slices > 0){
        int coords[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        for(int i = 0, x2 = 0; x2 < x; i++, x2 += w){
            if(x2 != 0 && x2 != x){
                coords[i] = x2;
                std::cout << coords[i] << std::endl;
            }  
        }
    }
    
    return 0;
}
