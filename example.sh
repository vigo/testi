#!/usr/bin/env bash

source ./testi.sh


te_assert_equal "ali" "alix" "eşit değil"
te_assert_equal "ali1" "alix"
te_assert_equal 5 5
te_assert_not_equal "ali" "ali"


te_result
 

