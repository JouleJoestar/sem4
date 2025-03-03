#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

int
main ()
{

  int N = 10, i;
  srand (time (NULL));
  double *a = (double *) malloc (sizeof (int *) * N);
  for (i = 0; i < N; i++)
    {
      a[i] = -100 + rand () % (100 + 100 + 1);
    }
  for (i = 0; i < N; i++)
    {
      printf ("%7.2f\t", a[i]);
    }
  int *b = (int *) malloc (sizeof (int *) * N);
  for (i = 0; i < N; i++)
    {
      double x;
      x = a[i];
      int y = (int) x;
      b[i] = (int) y;
    }
  for (i = 0; i < N; i++)
    {
      printf ("%4d\t", b[i]);
    }
  return 0;
}
