#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(){
    int second;
    scanf("%d", &second);
    sleep(second);
    printf("code.c terminated in %d second.\n", second);
    return 0;
}
