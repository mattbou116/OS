#!/bin/bash

# TODO : look at this configure_compilation thing

function configure_compilation {
    rm mysh
    cd $OS/src

    res=$(make mysh framesize=$1 varmemsize=$2)
    mv mysh $OS/env

    if [[ $2 == "debug" ]]; then
        echo "$res"
    fi

    cd $OS/env
}

# mv mysh $OS/testcases/assignment1
# cd $OS/testcases/assignment1

echo "============================== A3 TESTS ================================"

if [[ $1 == "tc1" || $1 == "all" ]]; then

    echo "---------------------------- T_C1 TEST ------------------------------"

    configure_compilation 18 10
    ./mysh < $OS/testcases/assignment3/T_tc1.txt > $OS/testcases/assignment3/out/T_tc1_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc1_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc1_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc2" || $1 == "all" ]]; then

    echo "---------------------------- T_C2 TEST ------------------------------"

    configure_compilation 18 10
    ./mysh < $OS/testcases/assignment3/T_tc2.txt > $OS/testcases/assignment3/out/T_tc2_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc2_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc2_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc3" || $1 == "all" ]]; then

    echo "---------------------------- T_C3 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment3/T_tc3.txt > $OS/testcases/assignment3/out/T_tc3_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc3_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc3_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc4" || $1 == "all" ]]; then

    echo "---------------------------- T_C4 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment3/T_tc4.txt > $OS/testcases/assignment3/out/T_tc4_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc4_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc4_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc5" || $1 == "all" ]]; then

    echo "---------------------------- T_C5 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment3/T_tc5.txt > $OS/testcases/assignment3/out/T_tc5_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc5_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc5_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc6" || $1 == "all" ]]; then

    echo "---------------------------- T_C6 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment3/T_tc6.txt > $OS/testcases/assignment3/out/T_tc6_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc6_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc6_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc7" || $1 == "all" ]]; then

    echo "---------------------------- T_C7 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment3/T_tc7.txt > $OS/testcases/assignment3/out/T_tc7_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc7_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc7_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc8" || $1 == "all" ]]; then

    echo "---------------------------- T_C8 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment3/T_tc8.txt > $OS/testcases/assignment3/out/T_tc8_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc8_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc8_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc9" || $1 == "all" ]]; then

    echo "---------------------------- T_C9 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment3/T_tc9.txt > $OS/testcases/assignment3/out/T_tc9_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc9_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc9_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "tc10" || $1 == "all" ]]; then

    echo "---------------------------- T_C10 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment3/T_tc10.txt > $OS/testcases/assignment3/out/T_tc10_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment3/T_tc10_result.txt) <(sed -e '$a\' $OS/testcases/assignment3/out/T_tc10_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

