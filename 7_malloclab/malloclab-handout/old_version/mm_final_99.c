/*
 * mm.c
 *
 * Hao Wang 1300012703@pku.edu.cn
 *
 * Use segregated fits allocator and explicit free list to organize free blocks.
 * Use best fit in first FINDSUM blocks, then use first fit in rest blocks. 
 *
 * The minimum allocated block: 8 bytes
 *      [header] - [payload]
 * The minimum free block: 16 bytes
 *      [header] - [pred] - [succ] - [footer]
 * (4 bytes per [])
 * So the minimum block size is 16 bytes.
 *
 * Size class: {16},{24},{32},{40},{48},{56},{64},{72},{80},
 *             {81~128},{129~256},...,{2049~4096},{4096~inf}
 * The array of free lists is stored in the head of heap.
 *
 */

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "mm.h"
#include "memlib.h"

/* 
 * DEBUG - output dbg_printf 
 * PRINT_HEAP - output heap data
 */
//#define DEBUG
#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
#else
# define dbg_printf(...)
#endif
# define PRINT_HEAP 0


/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */


#define ALIGNMENT         8
#define ALIGN(p)          (((size_t)(p) + (ALIGNMENT-1)) & ~0x7)
#define WSIZE             4
#define DSIZE             8
#define CHUNKSIZE         4096
#define PACK(size, prev_alloc, alloc) ((size) | (prev_alloc << 1) | (alloc))
#define HEAD(bp)          ((void *)(bp) - WSIZE)       
#define FOOT(bp)          ((void *)(bp) + GET_SIZE(HEAD(bp)) - DSIZE) 
#define GET(p)            (*(unsigned int *)(p))           
#define PUT(p, val)       (*(unsigned int *)(p) = (val))  
#define GET_SIZE(p)       (GET(p) & ~0x7) 
#define GET_PREV_ALLOC(p) ((GET(p) & 0x2) >> 1)
#define GET_ALLOC(p)      (GET(p) & 0x1) 
#define MAX(a, b)         ((a) < (b) ? (b) : (a))
#define MIN(a, b)         ((a) > (b) ? (b) : (a))
#define ARRAYSIZE         16 /* words */
#define FINDSUM           40

/* global variables */
static void *heap_head;
static unsigned *array_head; /* array of list head pointer */
static unsigned *array_tail;
static void *data_head;
static void *last_block;

/* free list management */
static size_t ilog2(size_t x);
static inline unsigned *get_list(size_t size);
static inline void *pred_block(void *bp);
static inline void *succ_block(void *bp);
static inline size_t r2a(unsigned address);
static inline unsigned a2r(size_t address);
static void insert_to_list(void *bp);
static void delete_from_list(void *bp);


/* block operation */
static inline void *next_block(void *bp);
static inline void *prev_block(void *bp);
static inline size_t block_size(void *bp);
static inline size_t block_alloc(void *bp);
static inline size_t block_prev_alloc(void *bp);
static inline void mark(void *bp, size_t block_size, int is_prev_alloc, int is_alloc);

/* allocator helper function */
int mm_init(void);
static void *coalesce(void *bp);
static void place(void *bp, size_t block_size);
static void *extend_heap(size_t size);

/* allocator interface funciton */
void *malloc(size_t size);
void *realloc(void *old_bp, size_t size);
void *calloc(size_t nmemb, size_t size);
void free(void *bp);

/* debug */
static void print_heap();
void mm_checkheap(int verbose);


/*
 * ilog2 - return the floor of binary (base-2) logarithm of x
 */
static size_t ilog2(size_t x) {
    size_t y = 0;
    while (x != 0) {
        y++;
        x >>= 1;
    }
    return y - 1;
}

/*
 * get_list - return a pointer to the list head by size
 */
static inline unsigned *get_list(size_t size) {
    if (size <= 15 || (size & 0x7) != 0) {
        return NULL;
    } else if (size <= 80) {
        return array_head + size / 8 - 2;
    } else if (size <= 4096) {
        return array_head + ilog2(size - 1) + 3;
    } else {
        return array_head + ARRAYSIZE - 1;
    }
}

/*
 * pred_block - return pred block in the free list
 */
static inline void *pred_block(void *bp) {
    if (!*(unsigned *)bp) {
        return NULL;
    } 
    return (void*)((size_t)heap_head + (size_t)*(unsigned *)bp);
}

/*
 * succ_block - return succ block in the free list
 */
static inline void *succ_block(void *bp) {
    if (!*((unsigned *)bp + 1)) {
        return NULL;
    }
    return (void*)((size_t)heap_head + (size_t)*((unsigned *)bp + 1));
}

/*
 * r2a - transform a relative address to a absolute address
 */
static inline size_t r2a(unsigned address) {
    return (size_t)address + (size_t)heap_head;
}

/*
 * a2r - transform a absolute address to a relative address
 */
static inline unsigned a2r(size_t address) {
    return (unsigned)(address - (size_t)heap_head);
}

/*
 * insert_to_list - insert a new free block to a free list's head
 */
static void insert_to_list(void *bp) {
    unsigned *list_p;
    unsigned *p;
    unsigned *succ;
    dbg_printf("want to insert %d size block to list\n", (int)block_size(bp));
    p = (unsigned *)bp;
    list_p = get_list(block_size(bp));
    *(p + 1) = (unsigned)*list_p;
    *p = 0;
    *list_p = (unsigned)(size_t)a2r((size_t)p); /* pred */
    succ = (unsigned *)succ_block(bp);
    if (succ != NULL) {
         *succ = a2r((size_t)p);
    }
}

/*
 * delete_from_list - delete a free block from a free list
 */
static void delete_from_list(void *bp) {
    unsigned *p, *pred, *succ, *list_p;
    dbg_printf("want to delete %d size block from list\n", (int)block_size(bp));
    p = (unsigned *)bp;
    pred = pred_block(bp);
    succ = succ_block(bp);
    if (pred != NULL) { /* have a predecessor block */
        *(pred + 1) = *(p + 1);
    } else { /* first block in the free list */
        list_p = get_list(block_size(bp));
        *list_p = (unsigned)(size_t)a2r((size_t)succ);
    }
    if (succ != NULL) { /* have a successor block */
        *succ = *p;
    }
    *p = 0;
    *(p + 1) = 0;
}

/*
 * next_block - return next block
 */
static inline void *next_block(void *bp) {
    return bp + block_size(bp);
}

/*
 * prev_block - return previous block only when it's a free block
 */
static inline void *prev_block(void *bp) {
    /* previous block is allocated */
    if (GET_PREV_ALLOC(HEAD(bp))) {
        return NULL; 
    }
    /* previous block is free */
    return bp - GET_SIZE(bp - DSIZE);
}

/*
 * block_size - return block size 
 */
static inline size_t block_size(void *bp) {
    return GET_SIZE(HEAD(bp));
}

/*
 * block_alloc - return whether this block is allocated
 */
static inline size_t block_alloc(void *bp) {
    return GET_ALLOC(HEAD(bp));
}

/*
 * block_prev_alloc - return whether the previous block is allocated
 */
static inline size_t block_prev_alloc(void *bp) {
    return GET_PREV_ALLOC(HEAD(bp));
}

/*
 * mark - mark a block's header and footer
 */
static inline void mark(void *bp, size_t block_size, int is_prev_alloc, int is_alloc) {
    is_prev_alloc = !!is_prev_alloc;
    is_alloc = !!is_alloc;
    PUT(HEAD(bp), PACK(block_size, is_prev_alloc, is_alloc));
    if (!is_alloc) {
        PUT(FOOT(bp), PACK(block_size, is_prev_alloc, is_alloc));
    }
}

/*
 * mm_init - return -1 on error, 0 on success.
 */
int mm_init(void) {
    dbg_printf("want to mm_init\n");

    /* create initial empty heap */
    heap_head = mem_sbrk(ARRAYSIZE * WSIZE + 4 * WSIZE);
    if (heap_head == (void *)-1) {
        return -1;
    }
    array_head = (unsigned *)heap_head;
    array_tail = array_head + ARRAYSIZE;
    
    /* empty the array of free lists */
    memset(heap_head, 0, ARRAYSIZE * WSIZE);

    /* initialize the prologue and epilogue */
    data_head = heap_head + ARRAYSIZE * WSIZE;
    PUT(data_head, 0);
    PUT(data_head + (1 * WSIZE), PACK(DSIZE, 1, 1));
    PUT(data_head + (2 * WSIZE), PACK(DSIZE, 1, 1));
    PUT(data_head + (3 * WSIZE), PACK(0, 1, 1));
    last_block = NULL;

    dbg_printf("return from mm_init\n");
    return 0;
}

/*
 * coalesce - boundary tag coalescing
 * will delete coalesced old blocks from the free list, and
 * will insert the new block to the free list
 * return pointer to coalesced block
 */
static void *coalesce(void *bp) {
    size_t prev_alloc, next_alloc;
    size_t size;
    prev_alloc = block_prev_alloc(bp);
    next_alloc = block_alloc(next_block(bp));
    size = block_size(bp);
    dbg_printf("want to coalesce %d size block, prev alloc: %d, next alloc: %d\n", (int)size, (int)prev_alloc, (int)next_alloc);
    if (prev_alloc && next_alloc) { // alloc - free - alloc
        return bp;
    } else if (prev_alloc && !next_alloc) { // alloc - free - free
        delete_from_list(bp);
        delete_from_list(next_block(bp));
        if (next_block(bp) == last_block) {
            last_block = bp;
        } 
        size += block_size(next_block(bp));
        mark(bp, size, prev_alloc, 0);
        insert_to_list(bp);
    } else if (!prev_alloc && next_alloc) { // free - free (- alloc)
        delete_from_list(prev_block(bp));
        delete_from_list(bp);
        if (bp == last_block) {
            last_block = prev_block(bp);
        }
        size += block_size(prev_block(bp));
        bp = prev_block(bp);
        mark(bp, size, block_prev_alloc(bp), 0);
        insert_to_list(bp);
    } else if (!prev_alloc && !next_alloc) { // free - free - free
        delete_from_list(prev_block(bp));
        delete_from_list(bp);
        delete_from_list(next_block(bp));
        if (next_block(bp) == last_block) {
            last_block = prev_block(bp);
        }
        size += block_size(prev_block(bp)) + block_size(next_block(bp));
        bp = prev_block(bp);
        mark(bp, size, block_prev_alloc(bp), 0);
        insert_to_list(bp);
    }
    return bp;
}

/*
 * place - transform a free block to an allocated block,
 * then delete old free block from its free list
 * and insert the rest part to the corresponding free list
 */
static void place(void *bp, size_t alloc_block_size) {
    size_t size;
    delete_from_list(bp);
    size = block_size(bp);
    dbg_printf("want to place a %d size allocated block from a %d size free block\n", (int)alloc_block_size, (int)size);
    if (size - alloc_block_size >= 4 * WSIZE) {
        /* have rest part for a new free block */
        if (last_block == bp) {
            last_block = bp + alloc_block_size;
        }
        mark(bp, alloc_block_size, block_prev_alloc(bp), 1);
        bp += alloc_block_size;
        mark(bp, size - alloc_block_size, 1, 0);
        insert_to_list(bp);
    } else {
        /* have no rest part for a new free block */
        mark(bp, size, block_prev_alloc(bp), 1);
        mark(next_block(bp), block_size(next_block(bp)), 1, block_alloc(next_block(bp)));
    }
}

/*
 * extend_heap - extend heap with a new free block and return its block pointer
 */
static void *extend_heap(size_t size) {
    void *bp;
    dbg_printf("want to extend heap by %d size\n", (int)size);
    bp = mem_sbrk(size);
    if (bp == (void *)-1) {
        return NULL;
    }
    if (last_block == NULL) {
        last_block = bp;
        mark(bp, size, 1, 0);
    } else {
        mark(bp, size, block_alloc(last_block), 0);
        last_block = bp;
    }
    PUT(HEAD(next_block(bp)), PACK(0, 0, 1)); /* set new epilogue */
    insert_to_list(bp);
    bp = coalesce(bp);
    return bp;
}


/*
 * malloc - allocate a block with at least size bytes of payload
 */
void *malloc (size_t size) {
    size_t total_size, min_size, bsize; /* include prologue and epilogue */
    unsigned *list_p;
    void *bp, *bp_best;
    int cnt;
    int is_rest;

    dbg_printf("want to malloc(%d)\n", (int)size);
    print_heap();

    /* initialize */
    if (!heap_head) {
       mm_init();
    }

    /* calculate total block size */
    if (size <= 0) {
        return NULL;
    } else if (size <= 3 * WSIZE) {
        total_size = 4 * WSIZE;
    } else {
        total_size = DSIZE * ((size + WSIZE + DSIZE - 1) / DSIZE);
    }

    /* get corresponding free list */
    list_p = get_list(total_size);
    if (list_p == NULL) {
        return NULL;
    }

    /* best fit in first FINDSUM blocks */
    bp = (void *)(size_t)*list_p;
    cnt = 0;
    bp_best = NULL;
    while (bp != NULL && cnt < FINDSUM) {
        bsize = block_size((void *)r2a((size_t)bp));
        cnt++;
        if (bsize >= total_size) {
            if (bp_best == NULL || 
               (bp_best != NULL && block_size((void *)r2a((size_t)bp_best)) > bsize)) {
                bp_best = bp;
            } 
        }
        bp = succ_block((void *)r2a((size_t)bp));
    }
    if (bp_best != NULL) {
        place((void *)r2a((size_t)bp_best), total_size);
        return (void *)r2a((size_t)bp_best);
    } 

    /* first fit in other blocks */
    is_rest = 1;
    while (list_p != array_tail) {
        if (is_rest) {
            is_rest = 0;
        } else {
            bp = (void *)(size_t)*list_p;
        }
        while (bp != NULL) {
            if (block_size((void *)r2a((size_t)bp)) >= total_size) {
                place((void *)r2a((size_t)bp), total_size);
                dbg_printf("want to return 0x%x from malloc(%d) after find a block big enough \n", (int)bp, (int)size);
                print_heap();
                return (void *)r2a((size_t)bp);
            }
            bp = succ_block((void *)r2a((size_t)bp));
        }
        list_p++;
    }

    /* if there is no appropriate block, then extend heap */
    if (last_block != NULL && block_alloc(last_block) == 0) {
        min_size = total_size - block_size(last_block);
        if (min_size <= 3 * WSIZE) {
            min_size = 4 * WSIZE; 
        }
        bp = extend_heap(min_size);
    } else {
        bp = extend_heap(MAX(total_size, 256));
        //bp = extend_heap(total_size);
    }
    dbg_printf("just after extend heap\n");
    print_heap();
    if (bp == NULL) {
        return NULL;
    }
    place(bp, total_size);

    dbg_printf("want to return 0x%x from malloc(%d) and can't find big enough block\n", (int)bp, (int)size);
    print_heap();
    return (void *)r2a((size_t)bp);
}


/*
 * realloc - change the size of the block by 
 * mallocing a new block,
 * copying its data, and
 * freeing the old block.
 */
void *realloc(void *old_bp, size_t size) {
    void *new_bp;
    size_t old_size, new_size;
    dbg_printf("want to realloc old block at address 0x%lx to %d size new block\n", (long)old_bp, (int)size);
    if (old_bp == NULL) {
        return malloc(size);
    }
    if (size == 0) {
        free(old_bp);
        return NULL;
    }
    new_bp = malloc(size);
    if (new_bp == NULL){
        return NULL;
    }
    old_size = block_size(old_bp);
    new_size = MIN(old_size, block_size(new_bp)) - WSIZE;
    memcpy(new_bp, old_bp, new_size);
    free(old_bp);
    return new_bp;
}

/*
 * calloc - you may want to look at mm-naive.c
 * This function is not tested by mdriver, but it is
 * needed to run the traces.
 */
void *calloc (size_t nmemb, size_t size) {
    size_t bytes = nmemb * size;
    void *p;
    p = malloc(bytes);
    memset(p, 0, bytes);
    return p;
}

/*
 * free - free a allocated block
 */
void free(void *bp) {
    if (bp == NULL) {
        return;
    }
    dbg_printf("want to free %d size block in address 0x%lx\n", (int)block_size(bp), (long)bp);
    print_heap();
    if (block_alloc(bp) == 0) {
        return;
    }
    if (heap_head == NULL) {
        mm_init();
    }
    mark(bp, block_size(bp), block_prev_alloc(bp), 0);
    mark(next_block(bp), block_size(next_block(bp)), 0, block_alloc(next_block(bp)));
    insert_to_list(bp);
    bp = coalesce(bp);
    dbg_printf("want return from free %d size block in address 0x%lx\n", (int)block_size(bp), (long)bp);
    print_heap();
}

/*
 * print_heap - print all the data in heap
 */
static void print_heap() {
    int i, block_count;
    unsigned *list_p;
    void *bp;
    size_t size, alloc;
    if (PRINT_HEAP) {
        printf("\n----- arrays -----\n");
        list_p = (unsigned *)heap_head;
        for (i = 0; i <= 8; i++) {
            printf("0x%lx:  [%d, %d] -> %x\n", (long)list_p, 8 * (i + 2), 8 * (i + 2), (unsigned)*list_p);
            list_p++;
        }
        for (; i < ARRAYSIZE; i++) {
            printf("0x%lx:  [%d, %d] -> %x\n", (long)list_p, (1 << (i - 3)) + 1, 1 << (i - 2), (unsigned)*list_p);
            list_p++;
        }
        printf("----- blocks -----\n");
        bp = data_head + 4 * WSIZE;
        size = block_size(bp);
        alloc = block_alloc(bp);
        block_count = 0;
        while (!size == 0) {
            printf("\n----- block %d -----\n", block_count);
            block_count++;
            printf("bp: 0x%lx\n", (long)bp);
            printf("--- header ---\n");
            printf("size:  %d\n", (int)size);
            printf("prev alloc: %d\n", (int)block_prev_alloc(bp));
            printf("alloc: %d\n", (int)alloc);
            printf("---  data  ---\n");
            if (alloc == 0) { // free block
                printf("- pointer -\n");
                printf("pred: 0x%lx -> 0x%x\n", (long)bp, *(unsigned *)bp);
                printf("succ: 0x%lx -> 0x%x\n", (long)(bp + WSIZE), *((unsigned *)bp + 1));
            } else { // allocated block
                printf("data[%d~%d]\n", 0, (int)size / WSIZE - 2);
            }
            bp = next_block(bp);
            size = block_size(bp);
            alloc = block_alloc(bp);
        }
        printf("last_block: %lx\n\n\n", (long)last_block);
    }
}

/*
 * mm_checkheap
 */
void mm_checkheap(int verbose){
    void *bp;
    unsigned *list_p;
    unsigned *pred, *succ;
    int i;
    if (!verbose) {
        return;
    }
    bp = data_head + DSIZE;
    /* checking the heap */
    /* prologue */
    if (!(block_size(bp) == 8 && block_alloc(bp) == 1)) {
        printf("Invariant Error: prologue block\n");
    }
    /* blocks */
    bp = next_block(bp);
    while (block_size(bp) != 0) {
        if ((long)bp % DSIZE != 0) {
            printf("Invariant Error: block's address isn't aligned\n");
        }
        if (!block_alloc(bp)) {
            if (*(int *)HEAD(bp) != *(int *)FOOT(bp)) {
                printf("Invariant Error: block head and foot don't match\n");
            }
        }
        if (!block_prev_alloc(bp)) {
            if (block_prev_alloc(bp) != block_alloc(prev_block(bp))) {
                printf("Invariant Error: prev alloc bit doesn't match prev block\n");
            }
            if (block_alloc(bp) == 0) {
                printf("Inveriant Error: find consecutive free blocks\n");
            }
        }
        if (block_alloc(bp) == 0 && block_alloc(next_block(bp)) == 0) {
            printf("Inveriant Error: find consecutive free blocks\n");
        }
        if (block_size(bp) < 4 * WSIZE) {
            printf("Invariant Error: block is too small\n");
        }
        bp = next_block(bp);
    } 
    /* epilogue */
    if (!(block_size(bp) == 0 && block_alloc(bp) == 1)) {
        printf("Invariant Error: epilogue block\n");
    }

    /* checking the free list */
    list_p = (unsigned *)heap_head;
    for (i = 0; i < ARRAYSIZE; i++) {
        if (!*list_p) {
            continue;
        }
        bp = (unsigned *)r2a((size_t)*list_p);
        while (bp != NULL) {
            pred = pred_block(bp);
            succ = succ_block(bp);
            if (pred != NULL) {
                if (*(pred + 1) != a2r((size_t)bp)) {
                    printf("Invariant Error: inconsistent pointer\n");
                }
            }
            if (succ != NULL) {
                if (*succ != a2r((size_t)bp)) {
                    printf("Invariant Error: inconsistent pointer\n");
                }
            }
            if (get_list(block_size((void *)bp)) != list_p) {
                printf("Invariant Error: block size doesn't match list\n");
            }
            bp = succ;
        }
        list_p++;
    }
    print_heap();
}


