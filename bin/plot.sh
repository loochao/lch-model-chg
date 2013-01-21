#!/bin/bash
for i in `ls *.dat`; do
    j=`echo $i | grep -o '[0-9]\+'`
    sed "s/00/$j/" gplot.plt.bak > gplot.plt
    gnuplot < gplot.plt
done