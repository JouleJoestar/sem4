#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    
    int N , i, j;
    srand(time(NULL));
    printf("Введите количество элементов: ");
    scanf("%d",&N);
    double** a = (double**)malloc(sizeof(int*) * N);
    for(i = 0; i < N; i++)
        a[i] = (double*)malloc(sizeof(int*) * N);
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            a[i][j] = - 10 + rand()%(10 + 10 + 1);
        }
    }
    double min = 11;
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            if (a[i][j] < min){
                min = a[i][j];
            }
        }
    }
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            if (a[i][j] != min){
                printf("%7.3f      ", a[i][j]);
            }
            if (!(a[i][j] != min)) {
                printf("%7.3f-min  ", a[i][j]);
            }
        }
        printf("\n");
    }
   return 0;
}
