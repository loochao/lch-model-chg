#!/bin/bash

cd combine
arr=("ss" "pp" "sp" "45" "lr")

for i in `ls *.png_ss`
do
    j=${i%.*}
    montage  ${j}.png_ss  ${j}.png_pp  ${j}.png_sp  ${j}.png_45  ${j}.png_lr  -geometry 400x+15+5 ${j}.png
done