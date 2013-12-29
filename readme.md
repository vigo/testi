# Testi : Bash Test Suite
           __       
    ______/  \______
    \              /
     \            / 
      \          /  
     _/          \_ 
     \            / 
      >          <  
      \__________/  * Testi

Just trying to have some fun with Bash! Available commands are;

* te_assert_equal
* te_assert_not_equal

## Install

Include `testi.sh` to your script:

    #!/usr/bin/env bash

    source ./testi.sh


    te_assert_equal "ali" "alix" "eşit değil"
    te_assert_equal "ali1" "alix"
    te_assert_equal 5 5
    te_assert_not_equal "ali" "ali"


    te_result
