#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    
    int N = 10 , i, j, k=0, pr = 1;
    int max, min;
    srand(time(NULL));
    int** a = (int**)malloc(sizeof(int*) * N);
    int *b = (int*)malloc(sizeof(int*) * N);
    for(i = 0; i < N; i++)
        a[i] = (int*)malloc(sizeof(int*) * N);
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            a[i][j] = -40 + rand()%(40 + 40 + 1);
        }
    }
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            if (abs(j == N-i-1)){
                b[k] = a[i][j];
                k = k+1;
            }
        }
    }
    
    for (i = 0; i<k; i++){
        if (b[i] > 0){
            if (k > 0){
                pr = pr*b[i];
            }
        }
    }
    if (pr > 0){
        printf("Произведение равно: %d", pr);
    }
    return 0;
}
