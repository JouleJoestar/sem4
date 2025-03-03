#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

int main()
{
    int Nmax = 10,i,j;
    int** a = (int**)malloc(sizeof(int*) * Nmax);
    for(i = 0; i < Nmax; i++)
        a[i] = (int*)malloc(sizeof(int*) * Nmax);
    for (j = 0; j <Nmax; j++){
        a[0][j] = 11;
    }
    for (i = 1; i <Nmax;i++){
        a[i][9] = 22;
    }
    for (j = 8; j>=0; j--){
        a[9][j] = 33;
    }
    for (i = 9; i>=1;i--){
        a[i][0] = 44;
    }
    for (j = 1; j <9; j++){
        a[1][j] = 55;
    }
    for (i = 2; i<9;i++){
        a[i][8] = 66;
    }
    for (j =7; j>=1; j--){
        a[8][j] = 77;
    }
    for (i = 7; i>=2;i--){
        a[i][1] = 88;
    }
    for (j = 2; j<8; j++){
        a[2][j] = 99;
    }
    for (i = 3; i<8;i++){
        a[i][7] = 11;
    }
    for (j =6; j>=2; j--){
        a[7][j] = 22;
    }
    for (i = 6; i>=3;i--){
        a[i][2] = 33;
    }
    for (j = 3; j<7; j++){
        a[3][j] = 44;
    }
    for (i = 4; i<7;i++){
        a[i][6] = 55;
    }
    for (j =5; j>=3; j--){
        a[6][j] = 66;
    }
    for (i = 5; i>=4;i--){
        a[i][3] = 77;
    }
    for (j = 4; j<6; j++){
        a[4][j] = 88;
    }
    for (j = 5; j>3; j--){
        a[5][j] = 99;
    }
    for (i = 0; i<Nmax;i++){
        for (j=0; j<Nmax;j++){
            printf("%4d", a[i][j]);
        }
        printf("\n");
    }
    return 0;
}
