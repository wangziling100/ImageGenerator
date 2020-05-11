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
#@git: <build env>
docker run -v $HOME/workspace:/workspace -it --name image-gen alpine bash &

mkdir /tmp/checked_file

#@git: <traverse dir>
#echo `pwd`
#echo $root_dir
#echo $0
script_root=$(dirname $0)/../
#echo $script_root
read_dir(){
    for f in `ls $root_dir`; do
        echo ----
        echo $f 
        #@git: if checked file or dir is effective
        abs_f=${root_dir}$f
        mv $abs_f /tmp/checked_file/
        #echo $abs_f
        dir0=$(dirname $abs_f)
        source ${script_root}test/test_function.sh
        result=$?
        echo $result
        if [ $result -eq 1 ]; then
            echo branch1 $result
            mv /tmp/checked_file/$f $dir0
        else
            echo branch2 $result
        fi
    done
}
read_dir $root_dir

# delete selected file or subdir, and test if the project runs rightly
rm -r /tmp/checked_file
docker container stop image-gen
docker container rm image-gen
