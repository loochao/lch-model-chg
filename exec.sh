#!/bin/bash
bin/dir.sh
sed 's/para.h/para_lr.h/' dan_eqn.c.bak > dan_eqn.c
gcc -Wall dan_eqn.c -o dan_eqn
dan_eqn
bin/plot.sh
bin/animate.sh
mv snapshot_* data/lr
mv animated.gif lr.gif
