#!/bin/bash

for data in `ls *.dat`; do
    head -2 $data > ${data}.info
    tail +3 $data > ${data}.bak
    mv ${data}.bak ${data}
done