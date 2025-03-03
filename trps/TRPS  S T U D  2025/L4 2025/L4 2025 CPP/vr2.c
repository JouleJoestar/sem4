#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    int N = 10, i,j,k=0,f = 0;
    double *a;
    a = (double*)malloc(N * sizeof(int));
    srand(time(NULL));
    a[0] = - 50 + rand()%(50 + 50 + 1);
    for (i=1; i<N; i++){
        while (f == 0){
            a[i] = - 50 + rand()%(50 + 50 + 1);
            for (j =0; j<i;j++){
                if (a[i] != a[j]) k++;
            }
            if (k == i) f = 1;
            k=0;
        }
        f = 0;

    }
    printf("Прямой вывод:\n");
    for (i=0; i<N; i++){
       printf("%f\n ", a[i]);
    }
    printf("Обратный вывод:\n");
    for (i=N-1; i>=0; i--){
       printf("%f\n ", a[i]);
    }
    return 0;
}
