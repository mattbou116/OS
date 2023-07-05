// interpret input from shell and output result of commands
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "shellmemory.h"
#include "macros.h"

typedef struct {
        char* argv[TOKEN_LIMIT];
        int argc;
} tokens;

// defining helper functions
int help();
int quit();
int set(char* var, char* val);
int print(char* var);
int run(char* script);
int unknown();

// tokenize input string into array
// NOTE: no reason to exceed token limit
// NOTE: asusming token size limit is equal to limit of amount of tokens
tokens tokenize(char* line) {
        // might have to free this
        tokens tkns;
        int i = 0; // index in the line
        int j = 0; // index in the tokens array
        while (line[i] != '\0') {
                int k = 0; // index in the token
                while (k < TOKEN_LIMIT && line[i] != ' ' && line[i] != '\0') {
                       strncat(tkns.argv[j], &line[i], 1);
                       k++;
                       i++;
                }
                j++;
                i++;
        }
        tkns.argc = j;
        return tkns;
}


// mathch command with certain behaviour.
int interpreter(char* line) {
        tokens tkns = tokenize(line);
        if (strcmp(tkns.argv[0], "help")) {
                help();                 
        } else if (strcmp(tkns.argv[0], "quit")) {
                quit();
        } else if (strcmp(tkns.argv[0], "set")) {
                if (tkns.argc == 3) {
                        set(tkns.argv[1], tkns.argv[2]);
                } else {
                        return unknown();
                }
        } else if (strcmp(tkns.argv[0], "print")) {
                if (tkns.argc == 2) {
                        print(tkns.argv[1]);
                } else {
                        return unknown();
                }

        } else if (strcmp(tkns.argv[0], "run")) {
                if (tkns.argc == 3) {
                        run(tkns.argv[1]);
                } else {
                        return unknown();
                }
        }
        return EXIT_FAILURE;
}

// EACH COMMAND SHOULD RESULT IN EXIT_FAILURE (1) OR EXIT_SUCCESS (0)

int help() {
        char* help = "help\t\t\tDisplays all the commands";
        char* quit = "quit\t\t\tExits/terminates the shell with 'Bye!'";
        char* set = "set VAR STRING\t\tAssigns a value to shell memory";
        char* print = "print VAR\t\tDisplays the STRING assigned to VAR";
        char* run = "run SCRIPT.txt\t\tExecutes the file SCRIPT.TXT";
        printf("%s\n%s\n%s\n%s\n%s\n", 
                        help, 
                        quit,
                        set,
                        print,
                        run);
        return 0;
}

int quit() {
        printf("Bye!\n");
        return EXIT_FAILURE; // value is 1 in POSIX
}

int set(char* var, char* val) {
        int result = mem_set(var, val);
        if (result == EXIT_FAILURE) {
                // No more space in memory
                printf("Memory overflow\n");
        }
        return result; 
}

int print(char* var) {
        char* result = mem_get(var);
        if (result == NULL) {
                printf("Variable does not exist\n");
                return EXIT_FAILURE;
        } else {
                printf("%s\n", result);
        }
        return EXIT_SUCCESS;
}

// Assuming the script exists in the current directory
int run(char* script) {
        FILE* fp;
        fp = fopen("script", "r");

        if (fp == NULL) {
                return EXIT_FAILURE;
        }
        
        char command[SCRIPT_LINE_SIZE];

        while(feof(fp)) {
                fgets(command, SCRIPT_LINE_SIZE, fp);
                
        }
}

int unknown() {
        printf("Unknown Command");
        return EXIT_FAILURE;
}
