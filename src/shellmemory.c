#include <string.h>
#include <stdlib.h>
// #include <stdio.h> // temp
#include "macros.h"
#include "rc.h"

typedef struct {
    char* var;
    char* val;
} shellmemory;

shellmemory shell_mem[SHELL_MEM_SIZE];

void mem_init() {
    for (int i=0; i<SHELL_MEM_SIZE; i++) {
        shell_mem[i].var = "EMPTY";
        shell_mem[i].val = "EMPTY";
    }
}

char* mem_get(const char* var) {
    for (int i=0; i<SHELL_MEM_SIZE; i++) {
        if (strcmp(shell_mem[i].var, var) == 0) {
            return shell_mem[i].val;
        }
    }

    return "";
}

// TODO: will need to change this when we remove values.
int mem_set(const char* var, const char* val) {
    // if don't dup, it will be pointing to token->arr which 
    // will get freed
    for (int i=0; i<SHELL_MEM_SIZE; i++) {
        if (strcmp(shell_mem[i].var, "EMPTY") == 0) {
            shell_mem[i].var = strdup(var);
            shell_mem[i].val = strdup(val);
            return 0;
        } else if (strcmp(shell_mem[i].var, var) == 0) {
            shell_mem[i].val = strdup(val);
            return 0;
        }
    }

    print_error(MEMORY_OVERFLOW);
    return MEMORY_OVERFLOW;
}
