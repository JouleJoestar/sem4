#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    
    int N = 70 , i, max = -20;
    srand(time(NULL));
    int *p = (int*)malloc(sizeof(int*) * N);
    for (i = 0; i<N; i++){
            p[i] = -20 + rand()%(30 + 20 + 1);
    }
    printf("Исходный массив:\n");
    for (i = 0; i<N; i++){
            printf("%3d\t", p[i]);
    }
    for (i = 0; i<N; i++){
        if (p[i] >= -20){
            if (p[i] <= 30){
                if (max < p[i]){
                    max = p[i];
                }
            }
        }
    }
    printf("\nМаксимум: %d\n", max);
    return 0;
}
