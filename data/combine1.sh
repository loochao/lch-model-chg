#!/bin/bash

arr=("ss" "pp" "sp" "45" "lr")
for i in ${arr[@]}
do
    cd $i
    for j in `ls *.png`
    do
        cp $j ../combine/${j}_${i}
    done
    cd ..
done

