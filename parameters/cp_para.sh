#!/bin/bash
arr=("ss" "pp" "sp" "45" "lr")
for i in ${arr[@]}
do
    cp para.h para_$i.h
done

