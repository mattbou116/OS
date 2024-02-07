#!/usr/bin/env bash

mv mysh $OS/testcases/assignment2
cd $OS/testcases/assignment2

echo "============================== A2 TESTS ================================"

if [[ $1 == "fcfs" || $1 == "all" ]]; then

    echo "---------------------------- T_FCFS TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_FCFS.txt > $OS/testcases/assignment2/out/T_FCFS_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_FCFS_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_FCFS_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "fcfs2" || $1 == "all" ]]; then

    echo "---------------------------- T_FCFS2 TEST -------------------------------"

    ./mysh < $OS/testcases/assignment2/T_FCFS2.txt > $OS/testcases/assignment2/out/T_FCFS2_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_FCFS2_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_FCFS2_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "fcfs3" || $1 == "all" ]]; then

    echo "---------------------------- T_FCFS3 TEST -------------------------------"

    ./mysh < $OS/testcases/assignment2/T_FCFS3.txt > $OS/testcases/assignment2/out/T_FCFS3_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_FCFS3_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_FCFS3_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "filenametest" || $1 == "all" ]]; then

    echo "-------------------------- T_FileNameTest TEST --------------------------"

    ./mysh < $OS/testcases/assignment2/T_FileNameTest.txt > $OS/testcases/assignment2/out/T_FileNameTest_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_FileNameTest_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_FileNameTest_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "aging" || $1 == "all" ]]; then

    echo "---------------------------- T_AGING TEST -------------------------------"

    ./mysh < $OS/testcases/assignment2/T_AGING.txt > $OS/testcases/assignment2/out/T_AGING_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_AGING_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_AGING_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "aging_2" || $1 == "all" ]]; then

    echo "---------------------------- T_AGING_2 TEST -------------------------------"

    ./mysh < $OS/testcases/assignment2/T_AGING.txt > $OS/testcases/assignment2/out/T_AGING_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_AGING_result2.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_AGING_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi


if [[ $1 == "aging2" || $1 == "all" ]]; then

    echo "--------------------------- T_AGING2 TEST -------------------------------"

    ./mysh < $OS/testcases/assignment2/T_AGING2.txt > $OS/testcases/assignment2/out/T_AGING2_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_AGING2_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_AGING2_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "aging3" || $1 == "all" ]]; then

    echo "---------------------------- T_AGING3 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment2/T_AGING3.txt > $OS/testcases/assignment2/out/T_AGING3_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_AGING3_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_AGING3_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "aging4" || $1 == "all" ]]; then

    echo "---------------------------- T_AGING4 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment2/T_AGING4.txt > $OS/testcases/assignment2/out/T_AGING4_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_AGING4_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_AGING4_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "aging4" || $1 == "all" ]]; then

    echo "---------------------------- T_AGING4_2 TEST ------------------------------"

    ./mysh < $OS/testcases/assignment2/T_AGING4.txt > $OS/testcases/assignment2/out/T_AGING4_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_AGING4_result2.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_AGING4_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "sjf" || $1 == "all" ]]; then

    echo "----------------------------- T_SJF TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_SJF.txt > $OS/testcases/assignment2/out/T_SJF_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_SJF_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_SJF_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "sjf2" || $1 == "all" ]]; then

    echo "---------------------------- T_SJF2 TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_SJF2.txt > $OS/testcases/assignment2/out/T_SJF2_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_SJF2_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_SJF2_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "sjf3" || $1 == "all" ]]; then

    echo "---------------------------- T_SJF3 TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_SJF3.txt > $OS/testcases/assignment2/out/T_SJF3_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_SJF3_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_SJF3_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "rr" || $1 == "all" ]]; then

    echo "------------------------------ T_RR TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_RR.txt > $OS/testcases/assignment2/out/T_RR_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_RR_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_RR_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "rr2" || $1 == "all" ]]; then

    echo "----------------------------- T_RR2 TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_RR2.txt > $OS/testcases/assignment2/out/T_RR2_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_RR2_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_RR2_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "rr3" || $1 == "all" ]]; then

    echo "----------------------------- T_RR3 TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_RR3.txt > $OS/testcases/assignment2/out/T_RR3_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_RR3_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_RR3_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "rr4" || $1 == "all" ]]; then

    echo "----------------------------- T_RR4 TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_RR4.txt > $OS/testcases/assignment2/out/T_RR4_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_RR4_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_RR4_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "rr30" || $1 == "all" ]]; then

    echo "----------------------------- T_RR30 TEST -------------------------------"

    ./mysh < $OS/testcases/assignment2/T_RR30.txt > $OS/testcases/assignment2/out/T_RR30_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_RR30_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_RR30_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "background" || $1 == "all" ]]; then

    echo "-------------------------- T_background TEST ----------------------------"

    ./mysh < $OS/testcases/assignment2/T_background.txt > $OS/testcases/assignment2/out/T_background_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_background_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_background_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "mt1" || $1 == "all" ]]; then

    echo "----------------------------- T_MT1 TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_MT1.txt > $OS/testcases/assignment2/out/T_MT1_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_MT1_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_MT1_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "mt2" || $1 == "all" ]]; then

    echo "----------------------------- T_MT2 TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_MT2.txt > $OS/testcases/assignment2/out/T_MT2_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_MT2_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_MT2_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi

if [[ $1 == "mt3" || $1 == "all" ]]; then

    echo "----------------------------- T_MT3 TEST --------------------------------"

    ./mysh < $OS/testcases/assignment2/T_MT3.txt > $OS/testcases/assignment2/out/T_MT3_out.txt
    result=$(diff <(sed -e '$a\' $OS/testcases/assignment2/T_MT3_result.txt) <(sed -e '$a\' $OS/testcases/assignment2/out/T_MT3_out.txt))

    if [ $? -eq 0 ]; then
        echo "Test Passed!"
    else
        if [[ $2 == "debug" ]]; then
            echo "$result"
        fi
        
        echo "Test Failed :(("
    fi
fi
