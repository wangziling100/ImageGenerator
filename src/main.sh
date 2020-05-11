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

mkdir -p /tmp/checked_file

#@git: <traverse dir>
read_dir(){
    for f in `ls $root_dir`; do
        #@git: if checked file or dir is effective
        mv $f /tmp/checked_file
        abs_f=${root_dir}$f
        echo $abs_f
        dir0=$(dirname $abs_f)
        base=$(basename $abs_f)
        source ${ws}test/test_function.sh
        result=$?
        echo $result
        if [ $result -eq 1 ]; then
            :
        else
            mv /tmp/checked_file/$base $dir0
        fi
    done
}
read_dir $root_dir

# delete selected file or subdir, and test if the project runs rightly
rm -r /tmp/checked_file
