// read input from shell and send to cmd_interpreter
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "macros.h"
#include "interpreter.h"
#include "shellmemory.h"

void interactive(char prompt, char* user_input);
void batch(char* user_input);

int main(int argc, char* argv[]) {
    printf("%s\n", "Shell version 1.2 Created January 2024\n");
    // flushing because system (execl) seemingly flushes stdout at process exit
    fflush(stdout);
    mem_init();
    char prompt = '$';

    // determine if input is batch or interactive
    if (isatty(STDIN_FILENO)) {
        // interactive
        char user_input[MAX_LINE];
        interactive(prompt, user_input);
    } else {
        // batch
        char user_input[MAX_LINE];
        batch(user_input);

        memset(user_input, '\0', MAX_LINE * sizeof(char));
        // resetting stdin and stdout streams to terminal
        freopen("/dev/tty", "r", stdin);
        freopen("/dev/tty", "w", stdout);

        interactive(prompt, user_input);
    }

    return 0;
}

void interactive(char prompt, char* user_input) {
    while (1) {
        printf("%c ", prompt);
        fgets(user_input, MAX_LINE, stdin);
        int rc = cmd_interpreter(user_input);
        if (rc != 0) exit(rc);
    }
}

void batch(char* user_input) {
    while (!feof(stdin)) {
        fgets(user_input, MAX_LINE, stdin);
        int rc = cmd_interpreter(user_input);
        if (rc != 0) exit(rc);
    }
}
