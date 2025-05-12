#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <sys/time.h>
#include <time.h>

long long get_time_usec() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (long long)tv.tv_sec * 1000000 + tv.tv_usec;
}

int main() {
    const int N = 100;
    int *a;
    a = (int*)malloc(N * sizeof(int));
    if (!a) {
        fprintf(stderr, "Ошибка выделения памяти\n");
        return 1;
    }

    srand(time(NULL));
    bool used[101] = {false}; // хеш-таблица на (-50,50)

    long long gen_start = get_time_usec();

    for (int i = 0; i < N; i++) {
        int val;
        do {
            val = -50 + rand() % 101;
        } while (used[val + 50]);
        used[val + 50] = true;
        a[i] = val;
    }

    long long gen_end = get_time_usec();

    printf("\nПрямой вывод:\n");
    for (int i = 0; i < N; i++) {
        printf("%d\n", a[i]);
    }

    printf("\nОбратный вывод:\n");
    for (int i = N - 1; i >= 0; i--) {
        printf("%d\n", a[i]); 
    }

    free(a);
    printf("\nВремя работы: %lld мкс\n", gen_end - gen_start);

    return 0;
}
