#!/bin/bash

# echo "Edited the end of test files so that they would have a newline char"
# echo "Did so by doing vim o and VD"

function print_help() {
    echo -e "<bar> [OPTIONS] [COMMANDS]"
    echo -e "quick script to build, and test the shell program\n"
    echo -e "OPTIONS:"
    echo -e "-h,--help\t\tdisplay this help\n"
    echo -e "COMMANDS:"
    echo -e "make\t\t\tbuild the program"
    echo -e "clean\t\t\tremove exucutables and object files"
    echo -e "a1 [all|<name>]\t\ttest on the assignment 1 tests"
    echo -e "a2 [all|<name>]\t\ttest on the assignment 2 tests"
    echo -e "a3 [all|<name>]\t\ttest on the assignment 3 tests"
}

if [[ $1 == "--help" || $1 == "-h" ]]; then
    print_help
    exit
fi

cd $OS/src

if [[ $1 == "clean" ]]; then    
    rm $OS/env/bin/mysh
    make clean
    exit
fi

make mysh # framesize=0 varmemsize=0

if [[ $1 == "make" ]]; then    
    exit
fi

mv mysh $OS/env/bin
cd $OS/env

case $1 in
    "a1") 
        if [[ ! -f "bin/mysh" ]]; then
            echo "mysh executable not found in env/bin"
            exit
        fi
        if [[ ! -f "a1-testing.sh" ]]; then
            echo "assignment 1 test script not found"
            exit
        fi
        mv bin/mysh $OS/testcases/assignment1
        timeout 1 ./a1-testing.sh $2 $3
        if [[ $? -ne 0 ]]; then
            echo "Shell program ran for too long."
        fi
        mv $OS/testcases/assignment1/mysh $OS/env/bin
        ;;
    "a2")
        if [[ -f "a2-testing.sh" ]]; then
            timeout 1 ./a2-testing.sh $2 $3
            if [[ $? -ne 0 ]]; then
                echo "Shell program ran for too long."
            fi
        fi
        ;;
    "a3")
        if [[ -f "a3-testing.sh" ]]; then
            timeout 1 ../a3-testing.sh $2 $3
            if [[ $? -ne 0 ]]; then
                echo "Shell program ran for too long."
            fi
        fi
        ;;
    "all")
        if [[ ! -f "bin/mysh" ]]; then
            echo "mysh executable not found in env/bin"
            exit
        fi
        for i in {1..3}
        do
            if [[ -f "a$i-testing.sh" ]]; then
                timeout 1 "./a$i-testing.sh" $2 $3
                if [[ $? -ne 0 ]]; then
                    echo "Shell program ran for too long."
                fi
            fi
        done
        ;;
esac
