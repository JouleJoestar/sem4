#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
int main ()
{
  char s[10][32];
  char  q[3][32];
  char  z[3][32];
  char w;
  int x[3];
  int c;
  s[0][32] = "YEAR";
  s[1][32] = "CAT";
  s[2][32] = "FREEZE";
  s[3][32] = "SLIM";
  s[4][32] = "MANUFACTURER";
  s[5][32] = "ANIMALS";
  s[6][32] = "RESPONSIBLE";
  s[7][32] = "BOUQUET";
  s[8][32] = "ENCOUNTER";
  s[9][32] = "LANTERN";
  srand(time(NULL));
  for (int i = 0; i < 3; i++){
      c = 0 + rand()%(9 - 0 + 1);
      q[i][32] = s[c][32];
  }
  
  for (int i = 0; i < 3; i++){
      printf("%s\t", q[i]);
  }
  printf("\n");
  for(int i = 1; i < 3; i++)
        for(int j = 0; j < 3-i; j++)
            if(strcmp(q[j], q[j+1]) > 0){
                strcpy(z[1], q[j]);
                strcpy(q[j], q[j+1]);
                strcpy(q[j+1], z[1]);
            }
    for(int i = 0; i < 3; i++)
        printf("%s\t", q[i]);
  return 0;
}
