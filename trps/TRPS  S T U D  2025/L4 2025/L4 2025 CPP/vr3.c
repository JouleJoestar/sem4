#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    int N = 10, i,j,k=0,f = 0;
    double *a;
    double pr = 1;
    a = (double*)malloc(N * sizeof(int));
    srand(time(NULL));
    a[0] = - 100 + rand()%(100 + 100 + 1);
    for (i=1; i<N; i++){
        while (f == 0){
            a[i] = - 100 + rand()%(100 + 100 + 1);
            for (j =0; j<i;j++){
                if (a[i] != a[j]) k++;
            }
            if (k == i) f = 1;
            k=0;
        }
        f = 0;
        
    }
    printf("Исходный массив:\n");
    for (i=0; i<N; i++){
       printf("%f\n ", a[i]);
    }
    for (i=0; i<N; i++){
       pr *= a[i];
    }
    printf("Произведение:%f\n",pr);
    return 0;
}
