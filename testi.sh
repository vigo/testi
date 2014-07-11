#!/usr/bin/env bash

# return 0 => True

set -e

TE_EXECUTED_COUNT=0
TE_PASSED_COUNT=0
TE_FAILED_COUNT=0

function te_print_error
{
    echo -e "Fail: ${1}"
}

function te_assert_equal
{
    ((TE_EXECUTED_COUNT+=1))
    if [[ $1 == $2 ]]; then
        ((TE_PASSED_COUNT+=1))
    else
        local error_msg=""
        if [[ $3 ]]; then
            error_msg="${1}, ${2} : ${3}"
        else
            error_msg="${1} is not equal to ${2}"
        fi
        te_print_error "${error_msg}"
        ((TE_FAILED_COUNT+=1))
    fi
}


function te_assert_not_equal
{
    ((TE_EXECUTED_COUNT+=1))
    if [[ $1 != $2 ]]; then
        ((TE_PASSED_COUNT+=1))
    else
        local error_msg=""
        if [[ $3 ]]; then
            error_msg="${1}, ${2} : ${3}"
        else
            error_msg="${1} is equal to ${2}"
        fi
        te_print_error "${error_msg}"
        ((TE_FAILED_COUNT+=1))
    fi
}

function te_file_system_operations
{
    if [ $1 $2 ]; then
        echo "true"
    else
        echo "false"
    fi
}

# function myfunc()
# {
#     local  myresult='some value'
#     echo "$myresult"
# }
# 
# result=$(myfunc)   # or result=`myfunc`
# echo $result

function te_file_operation
{
    ((TE_EXECUTED_COUNT+=1))
    case $1 in
        file_exists)
            result=$(te_file_system_operations "-f" $2);;
        folder_exists)
            result=$(te_file_system_operations "-d" $2);;
        file_readable)
            result=$(te_file_system_operations "-r" $2);;
        file_writable)
            result=$(te_file_system_operations "-w" $2);;
        file_executable)
            result=$(te_file_system_operations "-x" $2);;
        file_symlink)
            result=$(te_file_system_operations "-h" $2);;
        file_empty)
            result=$(te_file_system_operations "-s" $2);;
        *)
            ((TE_EXECUTED_COUNT-=1));;
    esac
    
    if [[ $result == "true" ]]; then
        ((TE_PASSED_COUNT+=1))
    elif [[ $result == "false" ]]; then
        local error_msg=""
        if [[ $3 ]]; then
            error_msg="${3}"
        else
            error_msg="Not $1: ${2}"
        fi
        te_print_error "${error_msg}"
        ((TE_FAILED_COUNT+=1))
    else
        echo "Unknown test method: $1"
    fi
}

# report
function te_result
{
    echo "-------------------------------------------------------------------"
    echo "Runned: ${TE_EXECUTED_COUNT}"
    if [[ $TE_FAILED_COUNT > 0 ]]; then
        echo "Failed: ${TE_FAILED_COUNT}"
    fi
    if [[ $TE_PASSED_COUNT > 0 ]]; then
        echo "Passed: ${TE_PASSED_COUNT}"
    fi
    if [[ $TE_PASSED_COUNT == $TE_EXECUTED_COUNT ]]; then
        echo "All passed..."
    fi
}
