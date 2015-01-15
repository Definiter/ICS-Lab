#include <cstdio>
#include <cstdlib>

#define N 64
#define BLOCK 32

class ele{
public:
    unsigned long long address;
    unsigned long long tag, set, block;
    void parse_address(int t, int s, int b){
        unsigned long long ffff = -1;
        unsigned long long mask_tag = ~(ffff << t); 
        unsigned long long mask_set = ~(ffff << s);
        unsigned long long mask_block = ~(ffff << b);
        
        tag = (address >> (s + b)) & mask_tag;
        set = (address >> (b)) & mask_set;
        block = address && mask_block;
    }
};

ele A[N][N], B[N][N];

FILE *fout = fopen("decode.txt", "w");

int main(){
    
    stdout = fout;
    
    A[0][0].address = 0x6022c0;
    B[0][0].address = 0x6c22c0;

    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            A[i][j].address = A[0][0].address + (i * N + j) * 4;
            A[i][j].parse_address(54, 5, 5);
            B[i][j].address = B[0][0].address + (i * N + j) * 4;
            B[i][j].parse_address(54, 5, 5);
        }
    }
    
    for (int i = 0; i < BLOCK; i++){
        for (int j = 0; j < BLOCK; j++){
            printf("%2llx ", A[i][j].set);    
            if ((j + 1) % 8 == 0)
                printf("  ");
        }
        printf("\n");
        if ((i + 1) % 8 == 0)
            printf("\n");
    }

    printf("\n\n");

    for (int i = 0; i < BLOCK; i++){
        for (int j = 0; j < BLOCK; j++){
            printf("%2llx ", B[i][j].set);    
            if ((j + 1) % 8 == 0)
                printf("  ");
        }
        printf("\n");
        if ((i + 1) % 8 == 0)
            printf("\n");
    }
    
    fclose(fout);
}
