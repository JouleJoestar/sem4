#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    
    int N=10,j, i, sum = 0;
    srand(time(NULL));
    int** a = (int**)malloc(sizeof(int*) * N);
    for(i = 0; i < N; i++)
        a[i] = (int*)malloc(sizeof(int*) * N);
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            a[i][j] = -30 + rand()%(30 + 30 + 1);
        }
    }
    printf("\nИсходный массив:\n");
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            printf("%3d\t", a[i][j]);
        }
        printf("\n");
    }
    
    int** b = (int**)malloc(sizeof(int*) * N);
    for(i = 0; i < N; i++)
        b[i] = (int*)malloc(sizeof(int*) * N);
        
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            if (i == j){
                b[i][j] = a[i][j];
            }
        }
    }
    for (i = 0; i <N; i++){
        if (i == 0){
            for (j = 0; j<N; j++)
                b[i][j] = a[i][j];
        }
        if (i == 1){
            for (j = 1; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<1; j++)
                b[i][j] = 0;
        }
        if (i == 2){
            for (j = 2; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<2; j++)
                b[i][j] = 0;
        }
        if (i == 3){
            for (j = 3; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<3; j++)
                b[i][j] = 0;
        }
        if (i == 4){
            for (j = 4; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<4; j++)
                b[i][j] = 0;
        }
        if (i == 5){
            for (j = 5; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<5; j++)
                b[i][j] = 0;
        }
        if (i == 6){
            for (j = 6; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<6; j++)
                b[i][j] = 0;
        }
        if (i == 7){
            for (j = 7; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<7; j++)
                b[i][j] = 0;
        }
        if (i == 8){
            for (j = 8; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<8; j++)
                b[i][j] = 0;
        }
        if (i == 9){
            for (j = 9; j<N; j++)
                b[i][j] = a[i][j];
            for (j = 0; j<9; j++)
                b[i][j] = 0;
        }
    }
    printf("\nИзмененный массив:\n");
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            printf("%3d\t", b[i][j]);
        }
        printf("\n");
    }
    return 0;
}
