#!/usr/bin/env bash

cd $OS/testcases/assignment1

echo "============================== A1 TESTS ================================"

if [[ $1 == "set" || $1 == "all" ]]; then

    echo "------------------------------- SET TEST --------------------------------"

    ./mysh < $OS/testcases/assignment1/set.txt > $OS/testcases/assignment1/out/set_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/set_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/set_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi
fi

if [[ $1 == "prompt" || $1 == "all" ]]; then

    echo "------------------------------ PROMPT TEST ------------------------------"

    ./mysh < $OS/testcases/assignment1/prompt.txt > $OS/testcases/assignment1/out/prompt_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/prompt_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/prompt_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi
fi

if [[ $1 == "echo" || $1 == "all" ]]; then

    echo "------------------------------- ECHO TEST -------------------------------"

    ./mysh < $OS/testcases/assignment1/echo.txt > $OS/testcases/assignment1/out/echo_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/echo_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/echo_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi
fi

if [[ $1 == "run" || $1 == "all" ]]; then

    echo "------------------------------ RUN TEST ---------------------------------"

    ./mysh < $OS/testcases/assignment1/run.txt > $OS/testcases/assignment1/out/run_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/run_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/run_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi
fi

if [[ $1 == "ls" || $1 == "all" ]]; then

    echo "------------------------------- LS TEST ---------------------------------"

    ./mysh < $OS/testcases/assignment1/ls.txt > $OS/testcases/assignment1/out/ls_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/ls_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/ls_out.txt))

    rm -r toto 

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi
fi

if [[ $1 == "mkdir" || $1 == "all" ]]; then

    echo "------------------------------ MKDIR TEST -------------------------------"

    ./mysh < $OS/testcases/assignment1/mkdir.txt > $OS/testcases/assignment1/out/mkdir_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/mkdir_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/mkdir_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi

    rm -r test
fi

if [[ $1 == "badcommand" || $1 == "all" ]]; then

    echo "-------------------------- BADCOMMAND TEST ------------------------------"

    ./mysh < $OS/testcases/assignment1/badcommand.txt > $OS/testcases/assignment1/out/badcommand_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/badcommand_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/badcommand_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi
fi

if [[ $1 == "oneline" || $1 == "all" ]]; then

    echo "---------------------------- ONELINE TEST -------------------------------"

    ./mysh < $OS/testcases/assignment1/oneline.txt > $OS/testcases/assignment1/out/oneline_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/oneline_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/oneline_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi
fi

if [[ $1 == "oneline_2" || $1 == "all" ]]; then

    echo "-------------------------- ONELINE 2 TEST -------------------------------"

    ./mysh < $OS/testcases/assignment1/oneline2.txt > $OS/testcases/assignment1/out/oneline2_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/oneline2_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/oneline2_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi

    rm -r testdir
fi

if [[ $1 == "blankline" || $1 == "all" ]]; then

    echo "---------------------------- BLANKLINE TEST -------------------------------"

    ./mysh < $OS/testcases/assignment1/blankline.txt > $OS/testcases/assignment1/out/blankline_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment1/blankline_result.txt) <(sed -e '$a\' $OS/testcases/assignment1/out/blankline_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi

        echo "Test Failed :(("
    fi
fi
