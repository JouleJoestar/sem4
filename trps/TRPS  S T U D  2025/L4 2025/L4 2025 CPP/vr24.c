#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    
    int N, M,j, i, sum = 0;
    srand(time(NULL));
    printf("Введите зармер матрицы: ");
    scanf("%d%d", &N, &M);
    int** a = (int**)malloc(sizeof(int*) * N);
    for(i = 0; i < N; i++)
        a[i] = (int*)malloc(sizeof(int*) * N);
    for (i = 0; i<N; i++){
        for (j = 0; j<M; j++){
            a[i][j] = 10 + rand()%(90 - 10 + 1);
        }
    }
    for (i = 0; i<N; i++){
        for (j = 0; j<M; j++){
            printf("%3d\t", a[i][j]);
        }
        printf("\n");
    }
    for (i = 0; i<N; i++){
        for (j = 0; j<M; j++){
            if (i == j){
                if (a[i][j] > 9){
                    if (a[i][j] < 100){
                        sum = sum + a[i][j];
                    }
                }
            }
        }
    }
     printf("\nСумма: %d", sum);
    return 0;
}
