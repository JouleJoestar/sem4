#include <stdio.h>
#include <math.h>
#include <locale.h>

int main()
{
    
   double f(double x){
       return x*x;
   }
   
   double z1, x, z2, h, xn, xk, sum = 0;
   int k,n;
   xn = 0;
   xk = 1;
   n = 21;
   h = (xk-xn)/n;
   z1 = 0;
   z2 = 0;
   x = xn+h;
   k = 0;
   do {
       k++;
       if (k % 2 != 0) {
           z1 = f(x) + z1;
       }
       if (!(k % 2 != 0)) {
           z2 = f(x) + z2;
       }
       x = x+h;
   } while(k >= n-1);
   sum = h/3*(f(xn)+f(xk)+4*z1+2*z2);
   printf("%f", sum);
   return 0;
}
