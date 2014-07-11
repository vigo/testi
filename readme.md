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
    
    te_file_operation "file_exists" $HOME "$HOME folder değil"
    te_file_operation "folder_exists" $HOME
    te_file_operation "file_readable" ~/.vimrc
    te_file_operation "file_writable" ~/.vimrc
    te_file_operation "file_executable" ~/.vimrc
    te_file_operation "file_symlink" ~/.vimrc
    te_file_operation "file_symlink" ~/.s3cfg
    te_file_operation "file_empty" ~/.profile
    
    te_result

## Update
**2014-07-11**  
`te_file_operation` method supports:

* file_exists
* folder_exists
* file_readable
* file_writable
* file_executable
* file_symlink
* file_empty