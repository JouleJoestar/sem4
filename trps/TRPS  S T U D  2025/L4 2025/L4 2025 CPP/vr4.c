#include <stdio.h>
#include <math.h>
#include <locale.h>

int main()
{
    double func(double x){
        return x*x-4;
    }
    
    double x = -0.5, esp = 0.001; /*начальное значение и точность*/
    double p,b=1,ch,zn;
    double mass[10000];
    int  k = 0;
    do{
        p = x;
        ch = func(x)*(b-x);
        zn = (func(b) - func(x));
        x = x - ch/zn;
        k++;
        mass[k] = x;
    }
    while (abs(x-p)<= esp);
    printf("x = %f\ny = %f\nk = %i",x,func(x),k);
    return 0;
}
