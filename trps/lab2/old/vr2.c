#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <sys/time.h>
#include <ctime>

long long get_time_usec() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (long long)tv.tv_sec * 1000000 + tv.tv_usec;
}


int main()
{
    int N = 100, i,j,k=0,f = 0;
    double *a;
    a = (double*)malloc(N * sizeof(double)); //был int
    srand(time(NULL));

    long long gen_start = get_time_usec();

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
    
    long long gen_end = get_time_usec();

    printf("Прямой вывод:\n");
    for (i=0; i<N; i++){
       printf("%f\n ", a[i]);
    }
    printf("Обратный вывод:\n");
    for (i=N-1; i>=0; i--){
       printf("%f\n ", a[i]);
    }
    free(a);
    printf("\nВремя генерации: %lld мкс\n", gen_end - gen_start);

    return 0;
}

