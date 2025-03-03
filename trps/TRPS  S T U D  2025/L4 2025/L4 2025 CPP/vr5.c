#include <stdio.h>
#include <math.h>
#include <locale.h>

int main()
{
    double S;
    
    double ftest(double x){
        return x;
    }
    
    double f1(double x){
        return x+cos(x);
    }
    
    double f2(double x){
        double v = cos(x+1)*(x+1);
        if (v!=0){
            return sin(x+1)/v;
        }
        else printf("Ошибка!");
    }
    
    void Trap(double a, double b, int f, int n){
        double h, x;
        int i;
        h = (b-a)/n;
        x = a;
        S = 0;
        if (f == 1){
            for (i=0; i< n; i++){
                S = S + ftest(x);
                x = x+h;
            }
            S = h*((ftest(a)+ftest(b))/2+S);
        }
        if (f == 2){
            for (i=0; i< n; i++){
                S = S + f1(x);
                x = x+h;
            }
            S = h*((f1(a)+f1(b))/2+S);
        }
        if (f == 3){
            for (i=0; i< n; i++){
                S = S + f2(x);
                x = x+h;
            }
            S = h*((f2(a)+f2(b))/2+S);
        }
        
    }
    printf("Значения интегралов:\n");
    Trap(0,1,1,100);
    printf("S1 = %f - Тест для прямой y=x на интервале [0,1]\n", S);
    Trap(-1,1,2,100);
    printf("S2 = %f\n",S);
    Trap(1,100,3,100);
    printf("S3 = %f\n",S);
    return 0;
}
