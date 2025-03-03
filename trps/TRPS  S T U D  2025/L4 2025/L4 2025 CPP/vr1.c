#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

int main()
{
    int N = 10, i, j;
    float *a;
    a = (float*)malloc(N * sizeof(int));
    for (i=0; i<N; i++){
        a[i] = random();
    }
    printf("Исходный массив:\n");
    for (i=0; i<N; i++){
       printf("%f\n ", a[i]);
    }
    for (i=1;i<N;i++){
        for (j=0;j<N-1;j++){
            if (a[j]>a[j+1]){
                float x = a[j];
                a[j] = a[j+1];
                a[j+1] = x;
            }
        }
    }
    printf("Отсортированный массив:\n");
    for (i=0; i<N; i++){
       printf("%f\n ", a[i]);
    }
    return 0;
}
