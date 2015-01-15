/*
 * mm.c
 *
 * Hao Wang 1300012703@pku.edu.cn
 *
 * Use segregated fits allocator and explicit free list to organize free blocks.
 * Use first fit to scan free blocks.
 *
 * The minimum allocated block: 16 bytes
 *      [header] - [payload] - [padding] - [footer]
 * The minimum free block: 24 bytes
 *      [header] - [pred] - [pred] - [succ] - [succ] - [footer]
 * (4 bytes per [])
 * So the minimum block size is 24 bytes.
 *
 * Size class is {1},{2},{3,4},{5~8},...,{1025~2048},{2049~4096},{4097~inf}
 * The array of free lists is stored in the head of heap.
 *
 * Only support 64-bit machine.
 *
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "mm.h"
#include "memlib.h"

/* If you want debugging output, use the following macro.  When you hand
 * in, remove the #define DEBUG line. */
//#define DEBUG
#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
# define DEBUG_CHECKHEAP 1
#else
# define dbg_printf(...)
# define DEBUG_CHECKHEAP 0
#endif


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
#define PACK(size, alloc) ((size) | (alloc))
#define GET(p)            (*(unsigned int *)(p))           
#define PUT(p, val)       (*(unsigned int *)(p) = (val))  
#define GET_SIZE(p)       (GET(p) & ~0x7) 
#define GET_ALLOC(p)      (GET(p) & 0x1) 
#define HDRP(bp)          ((char *)(bp) - WSIZE)       
#define FTRP(bp)          ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE) 
#define NEXT_BLKP(bp)     ((char *)(bp) + GET_SIZE(((char *)(bp) - WSIZE)))
#define PREV_BLKP(bp)     ((char *)(bp) - GET_SIZE(((char *)(bp) - DSIZE)))
#define ARRAYSIZE         14 /* dwords */
#define MAX(a, b)         ((a) < (b) ? (b) : (a))
#define MIN(a, b)         ((a) > (b) ? (b) : (a))

/* global variables */
static char *heap_head = NULL;
static size_t **array_head; /* array of list head pointer */
static size_t **array_tail;
static char *data_head;

/* internal helper function */
static size_t **get_list(size_t size);
static void place(void *bp, size_t block_size);
static void mark(void *bp, size_t block_size, int is_allocated);
static void delete_from_list(void *bp);
static void insert_to_list(void *bp);
static void *extend_heap(size_t size);
static void *coalesce(void *bp);
static size_t ilog2(size_t x);

/*
 * Initialize: return -1 on error, 0 on success.
 */
int mm_init(void) {
    dbg_printf("want to mm_init\n");

    /* create initial empty heap */
    heap_head = mem_sbrk(ARRAYSIZE * DSIZE + 4 * WSIZE);
    if (heap_head == (void *)-1) {
        return -1;
    }
    array_head = (size_t **)heap_head;
    array_tail = array_head + ARRAYSIZE;
    
    /* empty the array of free lists */
    memset(heap_head, 0, ARRAYSIZE * DSIZE);

    /* initialize the prologue and epilogue */
    data_head = heap_head + ARRAYSIZE * DSIZE;
    PUT(data_head, 0);
    PUT(data_head + (1 * WSIZE), PACK(DSIZE, 1));
    PUT(data_head + (2 * WSIZE), PACK(DSIZE, 1));
    PUT(data_head + (3 * WSIZE), PACK(0, 1));

    dbg_printf("return from mm_init\n");
    return 0;
}

/*
 * log2 - return the floor of binary (base-2) logarithm of x
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
static size_t **get_list(size_t size) {
    if (size <= 0) {
        return NULL;
    } else if (size == 1) {
        return array_head;
    } else if (size == 2) {
        return array_head + 1;
    } else if (size <= 4096) {
        return array_head + (ilog2(size - 1) + 1);
    } else {
        return array_head + ARRAYSIZE - 1;
    }
}

/*
 * mark - mark a block's header and footer
 */
static void mark(void *bp, size_t block_size, int is_allocated) {
    is_allocated = !!is_allocated;
    PUT(HDRP(bp), PACK(block_size, is_allocated));
    PUT(FTRP(bp), PACK(block_size, is_allocated));
}


/*
 * insert_to_list - insert a new free block to a free list's head
 */
static void insert_to_list(void *bp) {
    size_t **list_p;
    size_t *p;
    dbg_printf("want to insert %d size block to list\n", GET_SIZE(HDRP(bp)));
    p = (size_t *)bp;
    list_p = get_list(GET_SIZE(HDRP(bp)));
    *(p + 1) = (size_t)*list_p;
    *p = (size_t)NULL;
    *list_p = p; /* pred */
    if (*(p + 1) != (size_t)NULL) { /* succ */
        *((size_t *)*(p + 1)) = (size_t)p;
    }
}


/*
 * delete_from_list - delete a free block from a free list
 */
static void delete_from_list(void *bp) {
    size_t *p, *pred, *succ, **list_p;
    dbg_printf("want to delete %d size block\n", (int)GET_SIZE(HDRP(bp)));
    p = (size_t *)bp;
    pred = (size_t *)*p;
    succ = (size_t *)*(p + 1);
    if (pred != NULL) { /* has a predecessor block */
        *(pred + 1) = *(p + 1);
    } else { /* first block in the free list */
        list_p = get_list(GET_SIZE(HDRP(bp)));
        *list_p = succ;
    }
    if (succ != NULL) { /* has a successor block */
        *succ = *p;
    }
    *(p + 1) = (size_t)NULL;
    *p = (size_t)NULL;
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
    mark(bp, size, 0);
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1)); /* set new epilogue */
    insert_to_list(bp);
    bp = coalesce(bp);
    return bp;
}

/*
 * place - transform a free block to an allocated block,
 * then delete old free block from its free list
 * and insert the rest part to the corresponding free list
 */

static void place(void *bp, size_t block_size) {
    size_t size;
    delete_from_list(bp);
    size = GET_SIZE(HDRP(bp));
    dbg_printf("want to place a %d size allocated block from a %d size free block\n", (int)block_size, (int)size);
    if (size - block_size >= 3 * DSIZE) {
        /* have rest part for a new free block */
        mark(bp, block_size, 1);
        bp += block_size;
        mark(bp, size - block_size, 0);
        insert_to_list(bp);
    } else {
        /* have no rest part for a new free block */
        mark(bp, size, 1);
    }
}


/*
 * malloc - allocate a block with at least size bytes of payload
 */
void *malloc (size_t size) {
    size_t block_size; /* include prologue and epilogue */
    size_t **list_p;
    size_t *p;
    void *bp;

    dbg_printf("want to malloc(%d)\n", (int)size);
    mm_checkheap(DEBUG_CHECKHEAP);

    /* initialize */
    if (!heap_head) {
       mm_init();
    }

    /* calculate total block size */
    if (size <= 0) {
        return NULL;
    } else if (size <= 2 * DSIZE) {
        block_size = 3 * DSIZE;
    } else {
        block_size = DSIZE * ((size + DSIZE + DSIZE - 1) / DSIZE);
    }

    /* get corresponding free list */
    list_p = get_list(block_size);
    if (list_p == NULL) {
        return NULL;
    }

    /* try to find a block big enough */
    while (list_p != array_tail) {
        p = *list_p;
        while (p != NULL) {
            if (GET_SIZE(HDRP(p)) >= block_size) {
                place(p, block_size);
                dbg_printf("want to return 0x%x from malloc(%d) after find a block big enough \n", (int)p, (int)size);
                mm_checkheap(DEBUG_CHECKHEAP);
                return (void *)p;
            }
            p = (size_t *)*(p + 1);
        }
        list_p++;
    }

    /* if there is no appropriate block, then extend heap */
    bp = extend_heap(block_size);
    dbg_printf("just after extend heap\n");
    mm_checkheap(DEBUG_CHECKHEAP);
    if (bp == NULL) {
        return NULL;
    }
    place(bp, block_size);

    dbg_printf("want to return 0x%x from malloc(%d) and can't find big enough block\n", (int)bp, (int)size);
    mm_checkheap(DEBUG_CHECKHEAP);
    return (void *)bp;
}



/*
 * coalesce - boundary tag coalescing
 * will delete coalesced old blocks from the free list, and
 * will insert the new block to the free list
 * return pointer to coalesced block
 */
static void *coalesce(void *bp) {
    void *prev_bp;
    void *next_bp;
    size_t size;
    prev_bp = PREV_BLKP(bp);
    next_bp = NEXT_BLKP(bp);
    size = GET_SIZE(HDRP(bp));
    dbg_printf("want to coalesce %d size block, prev alloc: %d, next alloc: %d\n", (int)size, (int)GET_ALLOC(HDRP(prev_bp)), (int)GET_ALLOC(HDRP(next_bp)));
    if (GET_ALLOC(HDRP(prev_bp)) && GET_ALLOC(HDRP(next_bp))) { // alloc - free - alloc
        return bp;
    } else if (GET_ALLOC(HDRP(prev_bp)) && !GET_ALLOC(HDRP(next_bp))) { // alloc - free - free
        delete_from_list(bp);
        delete_from_list(next_bp);
        size += GET_SIZE(HDRP(next_bp));
        mark(bp, size, 0);
        insert_to_list(bp);
    } else if (!GET_ALLOC(HDRP(prev_bp)) && GET_ALLOC(HDRP(next_bp))) { // free - free - alloc
        delete_from_list(prev_bp);
        delete_from_list(bp);
        size += GET_SIZE(HDRP(prev_bp));
        bp = prev_bp;
        mark(bp, size, 0);
        insert_to_list(bp);
    } else if (!GET_ALLOC(HDRP(prev_bp)) && !GET_ALLOC(HDRP(next_bp))) { // free - free - free
        delete_from_list(prev_bp);
        delete_from_list(bp);
        delete_from_list(next_bp);
        size += GET_SIZE(HDRP(prev_bp)) + GET_SIZE(HDRP(next_bp));
        bp = prev_bp;
        mark(bp, size, 0);
        insert_to_list(bp);
    }
    return bp;
}

/*
 * free - free a allocated block
 */
void free(void *bp) {
    if (bp == NULL) {
        return;
    }
    dbg_printf("want to free (%d)\n", (int)GET_SIZE(HDRP(bp)));
    mm_checkheap(DEBUG_CHECKHEAP);
    if (GET_ALLOC(HDRP(bp)) == 0) {
        return;
    }
    if (heap_head == NULL) {
        mm_init();
    }
    mark(bp, GET_SIZE(HDRP(bp)), 0);
    insert_to_list(bp);
    bp = coalesce(bp);
    dbg_printf("return free (%d)\n", (int)GET_SIZE(HDRP(bp)));
    mm_checkheap(DEBUG_CHECKHEAP);
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
    old_size = GET_SIZE(HDRP(old_bp));
    new_size = MIN(old_size, GET_SIZE(HDRP(new_bp))) - DSIZE;
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
 * Return whether the pointer is in the heap.
 * May be useful for debugging.
 */
/*
static int in_heap(const void *p) {
    return p <= mem_heap_hi() && p >= mem_heap_lo();
}*/

/*
 * Return whether the pointer is aligned.
 * May be useful for debugging.
 */
/*
static int aligned(const void *p) {
    return (size_t)ALIGN(p) == (size_t)p;
}*/

/*
 * mm_checkheap
 */
void mm_checkheap(int verbose) {
    int i, block_count;
    size_t **list_p;
    void *bp;
    size_t size, alloc;
    if (verbose) {
        printf("\n----- arrays -----\n");
        list_p = (size_t **)heap_head;
        for (i = 0; i < ARRAYSIZE; i++) {
            printf("0x%lx:  [%d, %d] -> %lx\n", (long)list_p, (1 << (i - 1)) + 1, 1 << i, (long)*list_p);
            list_p++;
        }
        printf("----- blocks -----\n");
        bp = data_head + DSIZE;
        size = GET_SIZE(HDRP(bp));
        alloc = GET_ALLOC(HDRP(bp));
        block_count = 0;
        while (!size == 0) {
            printf("\n----- block %d -----\n", block_count);
            block_count++;
            printf("bp: 0x%lx\n", (long)bp);
            printf("--- header ---\n");
            printf("size:  %d\n", GET_SIZE(HDRP(bp)));
            printf("alloc: %d\n", GET_ALLOC(HDRP(bp)));
            printf("--- data ---\n");
            if (alloc == 0) { // free block
                printf("- pointer -\n");
                printf("pred: 0x%lx -> 0x%lx\n", (long)bp, (long)*((size_t *)bp));
                printf("succ: 0x%lx -> 0x%lx\n", (long)(bp + DSIZE), (long)*((size_t *)(bp + DSIZE)));
            } else { // allocated block
                /*for (i = 0; i < size - DSIZE; i += WSIZE) {
                    printf("data[%d] = %d\n", i / WSIZE, *((int *)(bp + i)));
                }*/
                printf("data[%d~%d]\n", 0, (int)(size - DSIZE - WSIZE) / WSIZE);
            }

            printf("--- footer ---\n");
            printf("size:  %d\n", GET_SIZE(HDRP(bp)));
            printf("alloc: %d\n", GET_ALLOC(HDRP(bp)));
            
            bp = NEXT_BLKP(bp);
            size = GET_SIZE(HDRP(bp));
            alloc = GET_ALLOC(HDRP(bp));
        }
        printf("\n----- block %d -----\n", block_count);
        printf("--- header ---\n");
        printf("size:  %d\n", GET_SIZE(HDRP(bp)));
        printf("alloc: %d\n\n\n\n", GET_ALLOC(HDRP(bp)));
    }
}
