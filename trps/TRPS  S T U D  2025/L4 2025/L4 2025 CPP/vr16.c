#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    
    int N = 10 , i, j, f_min = 0, f_max = 0;
    int max, min;
    srand(time(NULL));
    int** a = (int**)malloc(sizeof(int*) * N);
    for(i = 0; i < N; i++)
        a[i] = (int*)malloc(sizeof(int*) * N);
    for (i = 0; i<N; i++){
        for (j = 0; j<N; j++){
            a[i][j] = - 100 + rand()%(100 + 100 + 1);
        }
    }
    for (i = 0; i<N; i++){
        for (j=0; j<N;j++){
            if (a[i][j] > max){
                max = a[i][j];
            }
            if (a[i][j] < min){
                min = a[i][j];
            }
        }
    }
    for (i = 0; i<N; i++){
        for (j=0; j<N;j++){
            if (a[i][j] == max){
                f_max = 1;
            }
            if (a[i][j] == min){
                f_min = 1;
            }
            if ((a[i][j] != max)&&(a[i][j] != min)){
                printf("%10d\t", a[i][j]);
            }
            if (f_min == 1){
               printf("%4d - min\t", a[i][j]);
            }
            if (f_max == 1){
               printf("%4d - max\t", a[i][j]);
            }
            f_max = 0;
            f_min = 0;
        }
        printf("\n");
    }  
    return 0;
}
