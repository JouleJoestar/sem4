#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    
    int N = 10 , i, j,m=0,u=0,sum=0;
    srand(time(NULL));
    int** a = (int**)malloc(sizeof(int*) * N);
    int *p = (int*)malloc(sizeof(int*) * 100);
    int *g = (int*)malloc(sizeof(int*) * 100);
    for(i = 0; i < N; i++)
        a[i] = (int*)malloc(sizeof(int*) * N);
        
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            a[i][j] = -60 + rand()%(60 + 60 + 1);
        }
    }
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            if (abs(j == N-i-1)){
                p[m] = a[i][j];
                m=m+1;
            }
        }
    }
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            if (i==j){
                g[u] = a[i][j];
                u=u+1;
            }
        }
    }
    printf("Исходный массив:\n");
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            printf("%3d\t", a[i][j]);
        }
        printf("\n");
    }
    printf("Главная диагональ:\n");
    for (i=0; i<u;i++){
        printf("%3d\t", g[i]);
    }
    printf("Побочная диагональ:\n");
    for (i=0; i<m;i++){
        printf("%3d\t", p[i]);
    }
    for (i=0; i<u;i++){
        if (g[i]%2 == 0){
            sum = sum + g[i];
        }
    }
    for (i=0; i<m;i++){
        if (p[i]%2 == 0){
            sum = sum + p[i];
        }
    }
    printf("Сумма: %d\n", sum);
    return 0;
}
