#!/usr/bin/env bash

set -e

TE_EXECUTED_COUNT=0
TE_FAILED_COUNT=0

function te_assert_equal
{
    ((TE_EXECUTED_COUNT+=1))
    if [[ $1 == $2 ]]; then
        echo "pass"
    else
        if [[ $3 ]]; then
            echo "${3}"
        else
            echo "${1} is not equal to ${2}"
        fi
        ((TE_FAILED_COUNT+=1))
    fi
}


function te_assert_not_equal
{
    ((TE_EXECUTED_COUNT+=1))
    if [[ $1 != $2 ]]; then
        echo "pass"
    else
        if [[ $3 ]]; then
            echo "${3}"
        else
            echo "${1} is equal to ${2}"
        fi
        ((TE_FAILED_COUNT+=1))
    fi
}


// report
function te_result
{
    echo "-------------------------------------------------------------------"
    echo "Runned: ${TE_EXECUTED_COUNT}"
    if [[ $TE_FAILED_COUNT > 0 ]]; then
        echo "Failed: ${TE_FAILED_COUNT}"
    else
        echo "All test(s) pass!"
    fi
}
