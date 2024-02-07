// TODO: find file from absolute path or env variables.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
// #include <errno.h>
#include "macros.h"
#include "interpreter.h"
#include "rc.h"
#include "shellmemory.h"

typedef struct { 
    char** arr;
    int len;
} token_array;

// tokenize user input
token_array* init_token_array();
void free_token_array(token_array* tr);
int tokenize(const char* line, token_array* tokens);

// commands/errors
int help();
int quit();
int set(token_array* tokens, const char* var);
int print(const char* var);
int run(const char* script);
int echo(const char* str);
int my_ls();
int my_mkdir(const char* dirname);
int my_touch(const char* filename);
int my_cd(const char* dirname);
int unknown();
int bad_command(const char* rc);

int help() {
    char* help = "help\t\t\tDisplays all the commands";
    char* quit = "quit\t\t\tExits/terminates the shell with 'Bye!'";
    char* set = "set VAR STRING\t\tAssigns a value to shell memory";
    char* print = "print VAR\t\tDisplays the STRING assigned to VAR";
    char* run = "run SCRIPT.txt\t\tExecutes the file SCRIPT.TXT";
    char* echo = "echo STRING or VAR\tDisplays the STRING or the STRING assigned to VAR";
    char* my_ls = "my_ls\t\t\tDisplays list of files and directories of CWD in sorted order";
    char* my_mkdir = "my_mkdir STRING or VAR\tCreates a directory of name STRING \n\t\t\t(STRING assigned to VAR) in CWD";
    char* my_touch = "my_touch STRING or VAR\tCreates a file of name STRING \n\t\t\t(STRING assigned to VAR) in CWD";
    char* my_cd = "my_cd STRING\t\tChanges CWD to the directory of name STRING";
    printf("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n", 
            help, 
            quit,
            set,
            print,
            run,
            echo,
            my_ls,
            my_touch,
            my_mkdir,
            my_cd);
    fflush(stdout);
    return 0;
}

int quit() {
    printf("Bye!\n");
    exit(0);
}

int set(token_array* tokens, const char* var) {
    char val[MAX_LINE] = {'\0'};

    for (int i=2; i<tokens->len && i<7; i++) {
        strcat(val, tokens->arr[i]);
        if (i<tokens->len-1) strcat(val, " ");
    }

    return mem_set(var, (const char*) val);
}

int print(const char* var) {
    char* result = mem_get(var);

    if (strcmp(result, "") == 0) {
        printf("Variable does not exist\n");
        fflush(stdout);   
    } else {
        printf("%s\n", result);
        fflush(stdout);
    }
    return 0;
}

// TODO: find file from absolute path or env variables.
int run(const char* script) {
    FILE* fp;
    fp = fopen(script, "r");

    if (fp == NULL) {
        return bad_command("File not found");
    }

    char command[MAX_LINE];
    int rc;

    while(!feof(fp)) {
        fgets(command, MAX_LINE, fp);
        rc = cmd_interpreter(command);
        if (rc != 0) return rc;
    }

    return 0;
}

int echo(const char* str) {
    if (str[0] == '$') {
        printf("%s\n", mem_get(str+1));
        fflush(stdout);
    } else {
        printf("%s\n", str);
        fflush(stdout);
    }
    return 0;
}

int my_ls() {
    if (system("ls | sort") == -1) return EXEC_FAILURE;
    return 0;
}

int my_mkdir(const char* dirname) {
    if (dirname[0] == '$')
        dirname = mem_get(dirname+1);

    // check if dirname is a valid token 
    //  (not empty, not a var that doesn't exist)
    if (strcmp(dirname, "") == 0) {
        return bad_command("my_mkdir");
    }

    int rc;
    // check if dirname has more than one token
    char* rv = strrchr(dirname, ' ');
    if (rv != NULL) bad_command("my_mkdir");
    else {
        int len = strlen(dirname);
        // need 7 not 6 for null char
        char* command = calloc(7+len, sizeof(char));
        strncat(command, "mkdir ", 7);
        strncat(command, dirname, len);
        rc = system(command);
        free(command);
    }

    if (rc == -1) return EXEC_FAILURE;
    return 0;
}

int my_touch(const char* filename) {
    int len = strlen(filename);
    char* command = calloc(7+len, sizeof(char));
    strncat(command, "touch ", 7);
    strncat(command, filename, len);

    int rc = system(command);
    free(command);

    if (rc == -1) return EXEC_FAILURE;
    return 0;
}

// chdir() -- ensures that change to cwd will persist
int my_cd(const char* dirname) {
    if (chdir(dirname)) return bad_command("my_cd");
    return 0;
}

int unknown() {
    printf("Unknown Command\n");
    fflush(stdout);
    return 0;
}

int bad_command(const char* rc) {
    printf("Bad command: %s\n", rc);
    fflush(stdout);
    return 0;
}

int cmd_interpreter(const char* line) {
    token_array* tokens = init_token_array();
    int rc = tokenize(line, tokens);
    if (rc != 0) return rc;
    // print_tokens(tokens); // debug

    if (tokens->len <= 0) {
        rc = unknown();
    } else if (strcmp(tokens->arr[0], "help") == 0) {
        rc = help();                 
    } else if (strcmp(tokens->arr[0], "quit") == 0) {
        rc = quit();
    } else if (strcmp(tokens->arr[0], "set") == 0) {
        if (tokens->len > 7) rc = bad_command("Too many tokens");
        else rc = set(tokens, tokens->arr[1]);
    } else if (strcmp(tokens->arr[0], "print") == 0) {
        if (tokens->len != 2) rc = bad_command("Incorrect amount of tokens (req. 2)");
        else rc = print(tokens->arr[1]);
    } else if (strcmp(tokens->arr[0], "run") == 0) {
        if (tokens->len != 2) rc = bad_command("Incorrect amount of tokens (req. 2)");
        else rc = run(tokens->arr[1]);
    } else if (strcmp(tokens->arr[0], "echo") == 0) {
        if (tokens->len != 2) rc = bad_command("Incorrect amount of tokens (req. 2)");
        else rc = echo(tokens->arr[1]);
    } else if (strcmp(tokens->arr[0], "my_ls") == 0) {
        if (tokens->len != 1) rc = bad_command("Incorrect amount of tokens (req. 1)");
        else rc = my_ls();
    } else if (strcmp(tokens->arr[0], "my_mkdir") == 0) {
        if (tokens->len != 2) rc = bad_command("Incorrect amount of tokens (req. 2)");
        else rc = my_mkdir(tokens->arr[1]);
    } else if (strcmp(tokens->arr[0], "my_touch") == 0) {
        if (tokens->len != 2) rc = bad_command("Incorrect amount of tokens (req. 2)");
        else rc = my_touch(tokens->arr[1]);
    } else if (strcmp(tokens->arr[0], "my_cd") == 0) {
        if (tokens->len != 2) rc = bad_command("Incorrect amount of tokens (req. 2)");
        else rc = my_cd(tokens->arr[1]);
    } else {
        rc = unknown();
    }

    free_token_array(tokens);
    return rc;
}

// TOKENIZE USER INPUT

token_array* init_token_array() {
    token_array* tr = malloc(sizeof(token_array));
    tr->len = 0;
    tr->arr = malloc(MAX_ARGS * sizeof(char*));

    for (int i=0; i<MAX_ARGS; i++) 
        tr->arr[i] = malloc(TOKEN_SIZE * sizeof(char)); 
    return tr;
}

void free_token_array(token_array* tr) {
    for (int i=0; i<MAX_ARGS; i++) 
        free(tr->arr[i]);
    free(tr->arr);
    free(tr);
}

void print_tokens(token_array* tokens) {
    for (int i=0; i<tokens->len; i++)
        printf("TOKEN: %s\n", tokens->arr[i]);
    fflush(stdout);
}

int is_end_line(const char* line, int* line_idx) {
    // by definition of fgets()
    return line[*line_idx] == '\n'
        || line[*line_idx] == '\r'
        || line[*line_idx] == '\0';
}

void skip_whitespace(const char* line, int* line_idx) {
    while ((*line_idx)<MAX_LINE && line[*line_idx]==' ' && !is_end_line(line, line_idx))
        (*line_idx)++;
}

int next_token(const char* line, token_array* tokens, int* line_idx) {
    if (tokens->len >= MAX_ARGS-1) {
        print_error(INVALID_ARG_AMT);
        return INVALID_ARG_AMT;
    }

    int tkn_idx = 0;

    // read next token into token array
    while (line[*line_idx]!=' ' && !is_end_line(line, line_idx)) {
        if (tkn_idx >= TOKEN_SIZE) {
            print_error(INVALID_TOKEN_SIZE);
            return INVALID_TOKEN_SIZE;
        }
        // thinks this copies the char into the new string?
        tokens->arr[tokens->len][tkn_idx] = line[*line_idx]; 
        (*line_idx)++;
        tkn_idx++;
    }

    // add a sentinel
    tokens->arr[tokens->len][tkn_idx] = '\0';
    tokens->len++;
    return 0;
} 

// tokenize input string into array
int tokenize(const char* line, token_array* tokens) {
    int line_idx = 0;
    int rc;

    while (line[line_idx]!=';' && !is_end_line(line, &line_idx)) {
        skip_whitespace(line, &line_idx);
        rc = next_token(line, tokens, &line_idx);
        if (rc != 0) return rc;
    }

    // add a sentinel
    tokens->arr[tokens->len] = NULL;
    return 0;
}
