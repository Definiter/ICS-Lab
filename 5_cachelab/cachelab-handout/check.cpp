#include <stdio.h>


void swap(int *a, int *b){
    *a ^= *b;
    *b ^= *a;
    *a ^= *b;
}

int A[64][64], B[64][64];

void transpose(int M, int N){
    int row, col, i, j;
    int t0, t1, t2, t3, t4, t5, t6, t7;
    for (row = 0; row < M; row += 8)
        for (col = 0; col < N; col += 8)
            // 8 * 8 block
            if (row != col){
                // 4 * 4 sub block
                // miss per block = 8 + 4 + 4 + 2 = 18
                for (i = 0; i < 4; i++)
                    for (j = 0; j < 4; j++)
                        B[col + j][row + i] = A[row + i][col + j];
                
                t0 = A[row][col + 4];
                t1 = A[row][col + 5];
                t2 = A[row][col + 6];
                t3 = A[row][col + 7];
                
                t4 = A[row + 1][col + 4];
                t5 = A[row + 1][col + 5];
                t6 = A[row + 1][col + 6];
                t7 = A[row + 1][col + 7];


                for (i = 4; i < 8; i++)
                    for (j = 0; j < 4; j++)
                        B[col + j][row + i] = A[row + i][col + j];

                for (i = 4; i < 8; i++)
                    for (j = 4; j < 8; j++)
                        B[col + j][row + i] = A[row + i][col + j];

                B[col + 4][row] = t0;
                B[col + 5][row] = t1;
                B[col + 6][row] = t2;
                B[col + 7][row] = t3;


                B[col + 4][row + 1] = t4;
                B[col + 5][row + 1] = t5;
                B[col + 6][row + 1] = t6;
                B[col + 7][row + 1] = t7;

                for (i = 2; i < 4; i++)
                    for (j = 4; j < 8; j++)
                        B[col + j][row + i] = A[row + i][col + j];
            } else {
                /*
                 *  set of A[0][0] ~ A[7][7] block
                 *
                    16 16 16 16 16 16 16 16      
                    1e 1e 1e 1e 1e 1e 1e 1e      
                     6  6  6  6  6  6  6  6      
                     e  e  e  e  e  e  e  e      
                    16 16 16 16 16 16 16 16      
                    1e 1e 1e 1e 1e 1e 1e 1e      
                     6  6  6  6  6  6  6  6    
                     e  e  e  e  e  e  e  e 
                 *
                 */
                // total miss per block = 32
                // copy A to B
                // divid A and B to
                // [1][2]
                // [3][4]
                // A[1] -> B[1]
                // A[2] -> B[3]
                // A[3] -> B[2]
                // A[4] -> B[4]
                // miss per block = 8 * 3 = 24
                t0 = A[row][col + 0];
                t1 = A[row][col + 1];
                t2 = A[row][col + 2];
                t3 = A[row][col + 3];
                t4 = A[row][col + 4];
                t5 = A[row][col + 5];
                t6 = A[row][col + 6];
                t7 = A[row][col + 7];
                for (i = 0; i < 7; i++){
                    if (i < 4){
                        B[row + i][col + 0] = t0;
                        B[row + i][col + 1] = t1;
                        B[row + i][col + 2] = t2;
                        B[row + i][col + 3] = t3;
                        
                        B[row + i + 4][col + 0] = t4;
                        B[row + i + 4][col + 1] = t5;
                        B[row + i + 4][col + 2] = t6;
                        B[row + i + 4][col + 3] = t7;
                    } else {
                        B[row + i - 4][col + 4] = t0;
                        B[row + i - 4][col + 5] = t1;
                        B[row + i - 4][col + 6] = t2;
                        B[row + i - 4][col + 7] = t3;

                        B[row + i][col + 4] = t4;
                        B[row + i][col + 5] = t5;
                        B[row + i][col + 6] = t6;
                        B[row + i][col + 7] = t7;
                    }
                    t0 = A[row + i + 1][col + 0];
                    t1 = A[row + i + 1][col + 1];
                    t2 = A[row + i + 1][col + 2];
                    t3 = A[row + i + 1][col + 3];
                    t4 = A[row + i + 1][col + 4];
                    t5 = A[row + i + 1][col + 5];
                    t6 = A[row + i + 1][col + 6];
                    t7 = A[row + i + 1][col + 7];
                }
                B[row + i - 4][col + 4] = t0;
                B[row + i - 4][col + 5] = t1;
                B[row + i - 4][col + 6] = t2;
                B[row + i - 4][col + 7] = t3;

                B[row + i][col + 4] = t4;
                B[row + i][col + 5] = t5;
                B[row + i][col + 6] = t6;
                B[row + i][col + 7] = t7;
                
                // then reverse B[0], B[1], B[2], B[3]
                // miss per block = 8
                for (i = 0; i < 4; i++)
                    for (j = i + 1; j < 4; j++)
                        swap(&B[row + i][col + j], &B[row + j][col + i]);
                for (i = 0; i < 4; i++)
                    for (j = i + 5; j < 8; j++)
                        swap(&B[row + i][col + j], &B[row + j - 4][col + i + 4]);
                for (i = 4; i < 8; i++)
                    for (j = i - 3; j < 4; j++)
                        swap(&B[row + i][col + j], &B[row + j + 4][col + i - 4]);
                for (i = 4; i < 8; i++)
                    for (j = i + 1; j < 8; j++)
                        swap(&B[row + i][col + j], &B[row + j][col + i]);
            } 
}


int main(){
    int i, j;
    for (i = 0; i < 16; i++)
        for (j = 0; j < 16; j++)
            A[i][j] = (i << 4) | j;
    for (i = 0; i < 16; i++){
        for (j = 0; j < 16; j++){
            printf("%3x", A[i][j]);
            if ((j + 1) % 8 == 0)
                printf("   ");
        }
        printf("\n");
        if ((i + 1) % 8 == 0)
            printf("\n");
    }
    printf("---------\n");
    transpose(64, 64);
    for (i = 0; i < 16; i++){
        for (j = 0; j < 16; j++){
            printf("%3x", B[i][j]);
            if ((j + 1) % 8 == 0)
                printf("   ");
        }
        printf("\n");
        if ((i + 1) % 8 == 0)
            printf("\n");
    }
    printf("---------\n");

    for (i = 0; i < 64; i++)
        for (j = 0; j < 64; j++)
            B[j][i] = A[i][j];
        
    for (i = 0; i < 16; i++){
        for (j = 0; j < 16; j++){
            printf("%3x", B[i][j]);
            if ((j + 1) % 8 == 0)
                printf("   ");
        }
        printf("\n");
        if ((i + 1) % 8 == 0)
            printf("\n");
    }
    printf("---------\n");

}
                     


