#!/bin/bash
#@git <main.sh>
#@git branch master

# This script finds out the effective parts of project files, and then minimizes the project through deleting the ineffective part

# command main.sh dirname
#@git <format input>
root_dir=$1
if [[ "${root_dir:${#root_dir}-1:1}" != "/" ]];then
    root_dir=${root_dir}/
fi

#@git <traverse dir>

# delete selected file or subdir, and test if the project runs rightly
