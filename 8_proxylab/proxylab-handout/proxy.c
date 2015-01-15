#include <stdio.h>
#include <limits.h>
#include "csapp.h"

#define MAX_CACHE_SIZE (1024*1024)
#define MAX_OBJECT_SIZE (100*1024)
#define MAX_OBJECT_SUM 10

#define MAX_HEADER_SUM 42

#define DEBUG
#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
#else
# define dbg_printf(...)
#endif

/* request headers */
static const char *user_agent = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3";
static const char *accept_type = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
static const char *accept_encoding = "Accept-Encoding: gzip, deflate";

/* cache */
char cache[MAX_OBJECT_SUM][MAX_OBJECT_SIZE];
char cache_host[MAX_OBJECT_SUM][MAXLINE];
int cache_port[MAX_OBJECT_SUM];
char cache_file[MAX_OBJECT_SUM][MAXLINE];
int cache_object_size[MAX_OBJECT_SUM];
int timestamp[MAX_OBJECT_SUM];
volatile int timer;

/* synchronization */
sem_t mutex;

/*
 * error - print error information
 */
void error(const char *type, const char *detail) {
    if (detail[0] == '\0') {
        fprintf(stderr, "%s error\n", type);
    } else {
        fprintf(stderr, "%s error: %s\n", type, detail);
    }
}

/*
 * parse_uri - parse URI into host:port/file
 */
int parse_uri(char *uri, char *host, int *port, char *file) {
    char *p;
    char st[MAXLINE];
    
    /* initialize */
    host[0] = '\0';
    *port = 80;
    file[0] = '\0';
    
    /* skip http:// */
    strncpy(st, uri, 7);
    st[7] = '\0';
    if (strcmp(st, "http://") == 0) {
        uri += 7;
    }
    
    /* parse */
    if (sscanf(uri, "%*[^:]:%d", port) != EOF) {
        sscanf(uri, "%[^:]:%*d%s", host, file);
        if (file[0] == '\0') { /* host:port */
            strcpy(file, "/");
        }
    } else {
        p = strchr(uri, '/');
        if (p == NULL) { /* host */
            sscanf(uri, "%s", host);
            strcpy(file, "/");
        } else { /* host/file */
            *p = '\0';
            sscanf(uri, "%s", host);
            *p = '/';
            sscanf(p, "%s", file);
        }
    }
    
    if (host[0] == '\0' || file[0] == '\0') {
        return -1;
    }
    return 1;
}

/*
 * header_exist - test if the header is existed
 */
int header_exist(const char *header) {
    char st[MAXLINE];
    sscanf(header, "%s", st);
    if (strcmp(st, "Host:") == 0 ||
        strcmp(st, "User-Agent:") == 0 ||
        strcmp(st, "Accept:") == 0 ||
        strcmp(st, "Accept-Encoding:") == 0 ||
        strcmp(st, "Connection:") == 0 ||
        strcmp(st, "Proxy-Connection:") == 0)
        return 1;
    return 0;
}

/*
 * proxy_thread - main proxy routine
 * client -> proxy -> server -> proxy -> client  
 */
void *proxy_thread(void *vargp) {
    /**************** var ****************/
    /* proxy as server */
    rio_t rio_to_client;
    int connfd;
    /* request information */
    char request_line[MAXLINE];
    char method[MAXLINE], uri[MAXLINE], version[MAXLINE]; /* request line */
    char host[MAXLINE], file[MAXLINE];
    int port;
    char request_header[MAX_HEADER_SUM][MAXLINE]; /* request header */
    int header_sum, i;

    /* proxy as client */
    rio_t rio_to_server;
    int clientfd, len;
    char forward_request[MAXLINE];
    /* response information */
    char response[MAXLINE];

    /* for cache */
    char *buffer;
    int object_size;  
    int min_timestamp, min_pos; 

    /**************** client -> proxy ****************/
    connfd = *(int *)vargp;
    free(vargp);
    pthread_detach(pthread_self());
    rio_readinitb(&rio_to_client, connfd);

    /* read request line */
    rio_readlineb(&rio_to_client, request_line, MAXLINE);
    dbg_printf("----- proxy debug info: client -> proxy -----\n");
    dbg_printf("%s", request_line);
    sscanf(request_line, "%s %s %s", method, uri, version);

    /* read request header */
    header_sum = 0;
    rio_readlineb(&rio_to_client, request_header[header_sum++], MAXLINE);
    while (strcmp(request_header[header_sum - 1], "\r\n") != 0) {
        dbg_printf("%s", request_header[header_sum - 1]);
        rio_readlineb(&rio_to_client, request_header[header_sum++], MAXLINE);
    }
    header_sum--;

    /* parse URI */
    dbg_printf("uri: %s\n", uri);
    if (parse_uri(uri, host, &port, file) < 0) {
        error("parse_uri", "cannot parse URI");
        if (close(connfd) < 0) {
            error("close", "cannot close connfd");
            return NULL;
        }
        return NULL;
    }
    dbg_printf("host: %s, port: %d, file: %s\n", host, port, file);
    dbg_printf("---------------------------------------------\n");

    /* send the cached web objected without connecting to server if possible */
    dbg_printf("timestamp: ");
    for (i = 0; i < MAX_OBJECT_SUM; i++) {
        dbg_printf("%d ", timestamp[i]);
    }
    dbg_printf("\n");
    for (i = 0; i < MAX_OBJECT_SUM; i++) {
        if (timestamp != 0) {
            if (strcmp(cache_host[i], host) == 0 &&
                cache_port[i] == port &&
                strcmp(cache_file[i], file) == 0) {
                dbg_printf("cache hit!\n");
                P(&mutex);
                timer++;
                timestamp[i] = timer;
                rio_writen(connfd, cache[i], cache_object_size[i]);
                if (close(connfd) < 0) {
                    error("close", "cannot close connfd");
                    return NULL;
                }
                V(&mutex);
                return NULL;
            }
        }
    }

    /**************** proxy -> server ****************/
    clientfd = open_clientfd(host, port);
    if (clientfd < 0) {
        error("open_clientfd", "cannot connect to host");
        if (close(connfd) < 0) {
            error("close", "cannot close connfd");
            return NULL;
        }
        return NULL;
    }
    /* forward request */
    sprintf(forward_request, "%s %s HTTP/1.0\r\n", method, file);
    sprintf(forward_request, "%sHost: %s\r\n", forward_request, host);
    sprintf(forward_request, "%s%s\r\n", forward_request, user_agent);
    sprintf(forward_request, "%s%s\r\n", forward_request, accept_type);
    sprintf(forward_request, "%s%s\r\n", forward_request, accept_encoding);
    sprintf(forward_request, "%sConnection: close\r\nProxy-Connection: close\r\n", forward_request);
    for (i = 0; i < header_sum; i++) {
        if (!header_exist(request_header[i])) {
            sprintf(forward_request, "%s%s", forward_request, request_header[i]);
        }
    }
    sprintf(forward_request, "%s\r\n", forward_request);
    dbg_printf("----- proxy debug info: proxy -> server -----\n");
    dbg_printf("%s", forward_request);
    dbg_printf("---------------------------------------------\n");
    rio_readinitb(&rio_to_server, clientfd);
    rio_writen(clientfd, forward_request, sizeof(forward_request));

    /**************** server -> proxy -> client ****************/
    buffer = (char *)calloc(MAX_OBJECT_SIZE, sizeof(char));
    if (buffer == NULL) {
        error("malloc", "cannot malloc buffer");
        if (close(connfd) < 0) {
            error("close", "cannot close connfd");
            return NULL;
        }
        return NULL;
    }
    object_size = 0;
    while ((len = rio_readnb(&rio_to_server, response, MAXLINE)) != 0) {
        if (object_size + len <= MAX_OBJECT_SIZE) {
            memcpy(buffer + object_size, response, len);
        }
        object_size += len;
        rio_writen(connfd, response, len);
    }
    /* cache the web object using LRU if possible */
    if (object_size < MAX_OBJECT_SIZE) { 
        P(&mutex);
        timer++;
        min_timestamp = INT_MAX;
        min_pos = -1;
        for (i = 0; i < MAX_OBJECT_SUM; i++) {
            if (min_timestamp > timestamp[i]) {
                min_timestamp = timestamp[i];
                min_pos = i;
            }
        }
        timestamp[min_pos] = timer;
        strcpy(cache_host[min_pos], host);
        cache_port[min_pos] = port;
        strcpy(cache_file[min_pos], file);
        cache_object_size[min_pos] = object_size;
        memcpy(cache[min_pos], buffer, MAX_OBJECT_SIZE);
        V(&mutex);
        dbg_printf("web object is cached in pos %d at time %d\n", min_pos, timer);
    }

    /* close connect */
    if (close(clientfd) < 0) {
        error("close", "cannot close clentfd");
        return NULL;
    }
    if (close(connfd) < 0) {
        error("close", "cannot close connfd");
        return NULL;
    }
    free(buffer);
    return NULL;
}

/*
 * SIGPIPE_handler - do nothing
 */
void SIGPIPE_handler(int sig) {
    return;
}

int main(int argc, char **argv) {
    int listenfd, proxy_port;
    int clientlen;
    int *connfd_p;
    struct sockaddr_in clientaddr;
    pthread_t tid;

    /* parse arguments */
    if (argc != 2) {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(1);
    }
    proxy_port = atoi(argv[1]);

    /* SIGPIPE handler */
    Signal(SIGPIPE, SIGPIPE_handler);

    /* main proxy routine */
    timer = 0;
    memset(cache, 0, sizeof(cache));
    memset(cache_host, 0, sizeof(cache_host));
    memset(cache_port, 0, sizeof(cache_port));
    memset(cache_file, 0, sizeof(cache_file));
    memset(cache_object_size, 0, sizeof(cache_object_size));
    memset(timestamp, 0, sizeof(timestamp));
    Sem_init(&mutex, 0, 1);
    listenfd = Open_listenfd(proxy_port);
    while (1) {
        /* wait for request from client */
        clientlen = sizeof(clientaddr);
        connfd_p = malloc(sizeof(int));
        *connfd_p = accept(listenfd, (SA *)&clientaddr, (socklen_t *)&clientlen);
        if (*connfd_p < 0) {
            error("accept", "");
            continue;
        }
        if (pthread_create(&tid, NULL, proxy_thread, connfd_p) != 0) {
            error("pthread_create", "cannot create a new pthread");
            continue;
        }
    }
    return 0;
}

