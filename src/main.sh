#!/bin/bash
#@git <main.sh>
#@git branch master

# This script finds out the effective parts of project files, and then minimizes the project through deleting the ineffective part

# command main.sh dirname
#@git: <format input>
root_dir=$1
if [[ "${root_dir:${#root_dir}-1:1}" != "/" ]];then
    root_dir=${root_dir}/
fi

#@git: <traverse dir>
read_dir(){
    for f in `ls $root_dir`; do
        #@git: if checked file or dir is effective
        echo $f
    done
}
read_dir $root_dir

# delete selected file or subdir, and test if the project runs rightly
