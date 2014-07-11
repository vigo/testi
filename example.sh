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
 

