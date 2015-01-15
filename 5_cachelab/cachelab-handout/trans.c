/*
 *  Hao Wang
 *  1300012703@pku.edu.cn
 */

/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */

void swap(int *a, int *b){
    *a ^= *b;
    *b ^= *a;
    *a ^= *b;
}

char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    REQUIRES(M > 0);
    REQUIRES(N > 0);

    int row, col, i, j;
    int t0, t1, t2, t3, t4, t5, t6, t7;



    // A start from 0x6022c0
    // B start from 0x6c22c0

    if (M == 32 && N == 32)
        for (row = 0; row < N; row += 8)
            for (col = 0; col < M; col += 8)
                for (i = row; i < row + 8 && i < N; i++){
                    for (j = col; j < col + 8 && j < M; j++)
                        if (i != j)
                            B[j][i] = A[i][j];
                    // A[i][i] and B[i][i] is in same cache set(line), which will
                    // cause eviction
                    if (row == col)
                        B[i][i] = A[i][i];
                }

    if (M == 64 && N == 64){
        
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

    if (M == 61 && N == 67)
        for (row = 0; row < N; row += 18)
            for (col = 0; col < M; col += 18)
                for (i = row; i < row + 18 && i < N; i++){
                    for (j = col; j < col + 18 && j < M; j++)
                        if (i != j)
                            B[j][i] = A[i][j];
                    if (row == col)
                        B[i][i] = A[i][i];
                }


    ENSURES(is_transpose(M, N, A, B));
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

