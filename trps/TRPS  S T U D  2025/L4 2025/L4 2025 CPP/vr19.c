#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    
    int N = 8 , i, j,m=0, k=0,q = 0;
    srand(time(NULL));
    int** a = (int**)malloc(sizeof(int*) * N);
    int *b = (int*)malloc(sizeof(int*) * 100);
    for(i = 0; i < N; i++)
        a[i] = (int*)malloc(sizeof(int*) * N);
        
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            a[i][j] = 40 - q;
            q = q+1;
        }
    }
    
    printf("Исходный массив:\n");
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            printf("%3d\t", a[i][j]);
        }
        printf("\n");
    }
    
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            b[k] = a[i][j];
            k = k+1;
        }
    }
    
    for (i=1;i<k;i++){
        for (j=0;j<k-1;j++){
            if (b[j]>b[j+1]){
                int x = b[j];
                b[j] = b[j+1];
                b[j+1] = x;
            }
        }
    }
    
    int** c = (int**)malloc(sizeof(int*) * N);
    for(i = 0; i < N; i++)
        c[i] = (int*)malloc(sizeof(int*) * N);
    
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            c[i][j] = b[m];
            m = m+1;
        }
    }
    printf("Отсортированный массив:\n");
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            printf("%3d\t", c[i][j]);
        }
        printf("\n");
    }
    return 0;
}
