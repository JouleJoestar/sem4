#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    int N , i, j, k, l;
    srand(time(NULL));
    printf("Введите количество элементов: ");
    scanf("%d",&N);
    double** a = (double**)malloc(sizeof(int*) * N);
    for(i = 0; i < N; i++)
        a[i] = (double*)malloc(sizeof(int*) * N);
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            a[i][j] = - 100 + rand()%(100 + 100 + 1);
        }
    }
    
    for (i = 1; i<N; i+=2){
        for (j = 1; j<N; j++){
            for (k =0; k<N-1; k++){
                if (a[i][k]>a[i][k+1]){
                    float x = a[i][k];
                    a[i][k] = a[i][k+1];
                    a[i][k+1] = x;
                }
            }
        }
    }
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            printf("%f    ", a[i][j]);
        }
        printf("\n");
    }
    return 0;
}
