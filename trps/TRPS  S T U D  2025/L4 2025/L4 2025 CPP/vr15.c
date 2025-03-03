#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int main()
{
    int Nmax = 1000, i, f =0, sum = 0;
    double *a;
    int m, k;
    a = (double*)malloc(sizeof(int*) * Nmax);
    srand(time(NULL));
    for (i = 0; i < Nmax; i++){
        a[i] = - 100 + rand()%(100 + 100 + 1);
    }
    printf("Введите диапазон:");
    scanf("%d", &m);
    scanf("%d", &k);
    for (i = 0; i < Nmax; i++){
        if (a[i] > m*1.0) f++;
        if (a[i] < k*1.0) f++;
        if (f > 0)
            if (f == 2)
                sum++;
        f=0;
    }
    for (i = 0; i < Nmax; i++){
        if (a[i] > m*1.0) f++;
        if (a[i] < k*1.0) f++;
        if (f > 0)
            if (f == 2)
                printf("%7.3f\n",a[i]);
        f=0;
    }
    printf("Количество элементов в заданном диапазоне: %d", sum);
    return 0;
}
