#!/bin/bash
arr=("ss" "pp" "sp" "45" "lr")
for i in ${arr[@]}
do
    if [ ! -d $i ]
    then
        mkdir $i;
    fi

done

