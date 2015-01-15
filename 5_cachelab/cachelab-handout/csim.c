/*
 *  Hao Wang
 *  1300012703@pku.edu.cn
 */

#include "cachelab.h"
#include <assert.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int verbose_flag;
int hit_count, miss_count, eviction_count;
char trace_file[100];

struct Cache_line{
    int valid;
    int tag;
    int *block;
    int access_time;
};

struct Cache_set{
    struct Cache_line *lines;
    int access_count;
    int valid_count;
};

struct Cache{
    int m, t, s, b, S, B, E, C;
    struct Cache_set *sets;
};

struct Cache cache;

void init_cache(int argc, char *argv[], struct Cache *cache){
    int argv_start = 1;
    verbose_flag = 0;
    switch (argc){
        case 10:
            verbose_flag = 1;
            argv_start = 2;
        case 9:
            cache->s = atoi(argv[argv_start + 1]);
            cache->E = atoi(argv[argv_start + 3]);
            cache->b = atoi(argv[argv_start + 5]);
            strcpy(trace_file, argv[argv_start + 7]);
            break;
        default:
            assert(0);
    }
    cache->S = 1 << cache->s;
    cache->B = 1 << cache->b;
    cache->m = 64;
    cache->t = cache->m - cache->s - cache->b;
    cache->C = cache->S * cache->E * cache->B;

    cache->sets = (struct Cache_set *)malloc(sizeof(struct Cache_set) * cache->S); 
    int i;
    for (i = 0; i < cache->S; i++){
        cache->sets[i].lines = (struct Cache_line *)malloc(sizeof(struct Cache_line) * cache->E);
        cache->sets[i].access_count = 0;
        cache->sets[i].valid_count = 0;
        int j;
        for (j = 0; j < cache->E; j++){
            //cache->sets[i].lines[j].block = (int *)calloc(cache->B, sizeof(int));
            cache->sets[i].lines[j].valid = 0;
            cache->sets[i].lines[j].tag = 0;
            cache->sets[i].lines[j].access_time = 0;
        }
    }
}

void parse_address(struct Cache *cache, unsigned long long address, int *tag, int *set, int *block){
    unsigned long long ffff = -1;
    unsigned long long mask_tag = ~(ffff << cache->t); 
    unsigned long long mask_set = ~(ffff << cache->s);
    unsigned long long mask_block = ~(ffff << cache->b);
    
    *tag = (address >> (cache->s + cache->b)) & mask_tag;
    *set = (address >> (cache->b)) & mask_set;
    *block = address && mask_block;
}

void cache_load(struct Cache *cache, int tag, int set, int block){
    int i;
    int miss = 1;
    for (i = 0; i < cache->E; i++){
        if (cache->sets[set].lines[i].valid && cache->sets[set].lines[i].tag == tag){
            cache->sets[set].access_count++;
            cache->sets[set].lines[i].access_time = cache->sets[set].access_count;
            if (verbose_flag)
                printf("hit ");
            hit_count++;
            miss = 0;
            break;
        }
    }
    if (miss){
        if (verbose_flag)
            printf("miss ");
        miss_count++;
        if (cache->sets[set].valid_count == cache->E){ // set full
            if (verbose_flag)
                printf("eviction ");
            eviction_count++;
            int LRU = 1 << 30, LRU_line;
            for (i = 0; i < cache->E; i++){
                if (LRU > cache->sets[set].lines[i].access_time){
                    LRU = cache->sets[set].lines[i].access_time;
                    LRU_line = i;
                }
            }
            cache->sets[set].access_count++;
            cache->sets[set].lines[LRU_line].access_time = cache->sets[set].access_count;
            cache->sets[set].lines[LRU_line].tag = tag;
        } else { // set not full
            for (i = 0; i < cache->E; i++){
                if (!cache->sets[set].lines[i].valid){
                    cache->sets[set].valid_count++;
                    cache->sets[set].access_count++;
                    cache->sets[set].lines[i].valid = 1;
                    cache->sets[set].lines[i].tag = tag;
                    cache->sets[set].lines[i].access_time = cache->sets[set].access_count;
                    break;
                }
            }
        }
    }
}

void cache_store(struct Cache *cache, int tag, int set, int block){
    cache_load(cache, tag, set, block);
}

void cache_modify(struct Cache *cache, int tag, int set, int block){
    cache_load(cache, tag, set, block);
    cache_store(cache, tag, set, block);
}

void parse_file(struct Cache *cache){
    FILE *fin = fopen(trace_file, "r");    
    while (!feof(fin)){
        char operation;
        unsigned long long address;
        int size;
        operation = fgetc(fin);
        if (operation == ' '){
            operation = fgetc(fin);
        }
        fscanf(fin, "%llx,%d", &address, &size);
        if (operation == 'L' || operation == 'S' || operation == 'M'){
            if (verbose_flag)
                printf("%c %llx,%d ", operation, address, size);
            int tag, set, block;
            parse_address(cache, address, &tag, &set, &block);
            //printf("\n%d %d %d\n", tag, set, block);
            if (operation == 'L'){
                cache_load(cache, tag, set, block);
            }
            if (operation == 'S'){
                cache_store(cache, tag, set, block);
            }
            if (operation == 'M'){
                cache_modify(cache, tag, set, block);
            }
            if (verbose_flag)
                printf("\n");
        }
        while (operation != '\n' && !feof(fin)){
            operation = fgetc(fin);
        }
    }    
    fclose(fin);
}

int main(int argc, char *argv[]){
    init_cache(argc, argv, &cache);
    hit_count = miss_count = eviction_count = 0;
    parse_file(&cache);
    printf("hits:%d misses:%d evictions:%d\n", hit_count, miss_count, eviction_count);
    //printSummary(hit_count, miss_count, eviction_count);
    return 0;
}
