#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

int main()
{
    int N = 20, i, j,k, m=1;
    int *a;
    a = (int*)malloc(N * sizeof(int));
    int *b;
    b = (int*)malloc(N * sizeof(int));
    for (i=0; i<N; i++){
        a[i] = -20 + rand()%(10 - 20 + 1);
    }
    printf("Исходный массив:\n");
    for (i=0; i<N; i++){
       printf("%d\n ", a[i]);
    }
    for (i=1;i<N;i++){
        for (j=0;j<N-1;j++){
            if (a[j]<a[j+1]){
                float x = a[j];
                a[j] = a[j+1];
                a[j+1] = x;
            }
        }
    }
    k = a[0];
    b[0] = k;
    for (i=1;i<N; i++){
        if (a[i] != k){
            b[m] = a[i];
            k = a[i];
            if (m > 0)
                m++;
        }
    }
    printf("Отсортированный массив:\n");
    for (i=0; i<m; i++){
       printf("%d\n", b[i]);
    }
    return 0;
}
