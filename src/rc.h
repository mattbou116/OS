#pragma once

// potentially should be macros
// potentially use errno()
typedef enum {
        INVALID_ARG_AMT = 1,
        INVALID_TOKEN_SIZE = 2,
        MEMORY_OVERFLOW = 3,
        EXEC_FAILURE = 4,
} error_code;

void print_error(error_code rc);
