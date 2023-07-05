#!/bin/bash

echo "Edited the end of test files so that they would have a newline char"
echo "Did so by doing vim o and VD"

cd $OS/src

if [[ $1 == "clean" ]]; then    
    exit
fi

make mysh framesize=0 varmemsize=0
mv mysh OS/testcases/bin

if [[ $1 == "make" ]]; then    
    exit
fi

cd $OS/testcases/bin

case $1 in
    "a1") 
        if [[ -f "$PWD/a1-testing.sh" ]]; then
            timeout 1 ./a1-testing.sh $2 $3
            if [[ $? -ne 0 ]]; then
                echo "Shell program ran for too long."
            fi
        fi
        ;;
    "a2")
        if [[ -f "$PWD/a2-testing.sh" ]]; then
            timeout 1 ./a2-testing.sh $2 $3
            if [[ $? -ne 0 ]]; then
                echo "Shell program ran for too long."
            fi
        fi
        ;;
    "a3")
        if [[ -f "$PWD/a3-testing.sh" ]]; then
            timeout 1 ./a3-testing.sh $2 $3
            if [[ $? -ne 0 ]]; then
                echo "Shell program ran for too long."
            fi
        fi
        ;;
    "all")
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

mv mysh $OS/env

# If you need to clean up the mysh program???
# cd $OS/src
# make clean

cd $OS/env

