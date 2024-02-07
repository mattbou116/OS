#include <stdio.h>
#include "macros.h"
#include "rc.h"

void print_error(error_code rc) {
    switch(rc) {
        case INVALID_ARG_AMT :
            fprintf(stderr, "error: invalid argument amount (max %d)\n",
                    MAX_ARGS);
            return;
        case INVALID_TOKEN_SIZE :
            fprintf(stderr, "error: invalid token amount (max %d)\n",
                    TOKEN_SIZE);
            return;
        case MEMORY_OVERFLOW :
            fprintf(stderr, "error: memory overflow\n");
            return;
        case EXEC_FAILURE :
            fprintf(stderr, "error: exec failure\n");
            return;
        default: return;
    }
}
