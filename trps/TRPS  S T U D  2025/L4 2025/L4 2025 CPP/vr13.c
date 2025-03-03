#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

int main()
{
    int Nmax = 10;
    int i,j,k,max,kx,ky,n,y;
    double eps;
    double** a = (double**)malloc(sizeof(int*) * Nmax);
    for(i = 0; i < n; i++)
        a[i] = (double*)malloc(sizeof(int*) * Nmax);
    double* s = (double*)malloc(sizeof(int*) * Nmax);
    double* sw = (double*)malloc(sizeof(int*) * Nmax);
    double* b = (double*)malloc(sizeof(int*) * Nmax);
    double* x = (double*)malloc(sizeof(int*) * Nmax);
    printf("Количество уравнений: ");
    scanf("%d",&n);
    printf("Введите максимальное число итераций: ");
    scanf("%d",&max);
    printf("Введите матрицу коэффициентов и свободные члены: ");
    eps = 0.01;
    for (i=0;i<n;i++){
        for (j=0; j<n; j++){
            printf("a[%d,%d] = \n",i,j);
            scanf("%f",&a[i][j]);
        }
    }
    for (i=0;i<n;i++){
        printf("b[%d] = \n",i);
        scanf("%f",&b[i]);
    }
    for (i=0;i<n;i++){
        x[i] = 0;   
    }
    k = 0;
    do{
        k++;
        sw[1] = 0;
        for (i=0;i<n;i++){
            s[i] = b[i];
            for (j=0;j<n;j++)
                s[i] = s[i] - a[i][j]*x[j];
            s[i] = s[i]/a[i][j];
            x[i] = s[i] + x[i];
            sw[1] = sw[1] + abs(s[i]);
        }
    } while ((k>=max) || (sw[1]<eps));
    for (i=0;i<n;i++)
        printf("x[%d] = %10.3f \n",i,x[i]);
    if (k<max) printf("k = %d\n",k);
    else printf("Сходимости нет");
    return 0;
}
