#include <stdio.h>
#include <stdlib.h>
int
main ()
{

  char mas[100];
  char new_mas[100];
  int i, j;
  int *a = (int *) malloc (sizeof (int *) * 100);
  int b[100];
  
  for (i = 0; i < 100; i++)
    {
      a[i] = 65 + rand () % (90 - 65 + 1);
    }
    
  for (i = 0; i < 100; i++)
    {
      mas[i] = (char) (a[i]);
    }
    printf ("\nИсходный массив:\n");
  for (i = 0; i < 100; i++)
    {
      printf ("%c\t", mas[i]);
      if ((i % 10 == 0) && (i > 0)) printf ("\n");
    }
  for (i = 0; i < 100; i++)
    {
      char t = mas[i];
      b[i] = (int)t;
    }
    
  for (i = 1; i < 100; i++)
    {
      for (j = 0; j < 99; j++)
	    {
	        if (b[j] < b[j + 1])
	            {
	                int x = b[j];
	                b[j] = b[j + 1];
	                b[j + 1] = x;
	            }
	    }
    }
  for (i = 0; i < 100; i++)
    {
      new_mas[i] = (char) (b[i]);
    }
    printf ("\nОтсортированный массив:\n");
  for (i = 0; i < 100; i++)
    {
      printf ("%c\t", new_mas[i]);
      if ((i % 10 == 0) && (i > 0)) printf ("\n");
    }
  return 0;
}
