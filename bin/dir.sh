#!/bin/bash
arr=("ss" "pp" "sp" "45" "lr")
for i in ${arr[@]}
do
    if [ ! -d data/$i ]
    then
        mkdir -p data/$i;
    fi
done

