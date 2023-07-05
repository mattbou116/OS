#include <string.h>
#include <stdlib.h>
#include "macros.h"

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

char* mem_get(char* var) {
        for (int i=0; i<SHELL_MEM_SIZE; i++) {
                if (strcmp(shell_mem[i].var, var)) {
                        return shell_mem[i].val;
                }
        }
        return NULL;
}

// probably will need to change this in the future
int mem_set(char* var, char* val) {
        for (int i=0; i<SHELL_MEM_SIZE; i++) {
                if (strcmp(shell_mem[i].var, "EMPTY")) {
                        shell_mem[i].var = strdup(var);
                        shell_mem[i].val = strdup(val);
                        return EXIT_SUCCESS;
                } else if (strcmp(shell_mem[i].var, var)) {
                        shell_mem[i].val = strdup(val);
                        return EXIT_SUCCESS;
                }
        }
        return EXIT_FAILURE;
}

/*
 * Incase add dynamic memory allocation to shell memory.
void mem_free(shellmemory *sm) {
        for (int i=0; i<sm->size; i++) {
                # free each var/value entry
        }
}
*/

