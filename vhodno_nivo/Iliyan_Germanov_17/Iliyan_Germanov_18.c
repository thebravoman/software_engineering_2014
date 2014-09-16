#include <stdio.h>

int odd(int num);
int div_x(int num, int x);
int prime(int num);

int main() {
    int x, num;
    int arr[10], arr_counter = 0;
    do {
        scanf("%d", &x);
    } while(x < 0);

    for(num = 1; arr_counter != 10; num++) {
        if(num > x) break;
        if(odd(num) && div_x(num, x)) {
            arr[arr_counter++] = num;
        }
    }

    for(num = 0; num < arr_counter; num++) {
        if(prime(arr[num])) {
            printf("prime: ");
        }
        printf("%d\n", arr[num]);
    }

    return 0;
}

int odd(int num) {
    return num % 2 ? 1 : 0;
}

int div_x(int num, int x) {
    return x % num ? 0 : 1;
}

int prime(int num) {
    int del;
    for(del = 2; del <= num / 2; del++) {
        if(num % del == 0) return 0;
    }
    return 1;
}
