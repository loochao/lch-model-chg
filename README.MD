# make all
first echo p1_sigma = 0.88 or 0.088 ... into p1-sigma.h
then compile dan_eqn.c
then run dan_eqn
which will generate 3 dat files

# make tail
These 3 files contain 2 line of info (Simulation parameter)
And data
make tail runs tail.sh
to generate an info file for each dat
and make a matlab-handlable dat file

# matlab plot
Then run matlab
call dataplot to generate an output figures.

# make store
dat files are actually smaller
so make store to generate an output folder
and mv *.dat *.info there

# X axis taken as fluence, t * I(== 80)
# 9 set of parameter
p1/sigma = 0.88 0.088 0.0088
sigma/eta = 0.019 0.0019 0.00019
When plot, h01, refers to (0.88, 0.019), for there's
0 and 1 zero after dot and before [109]
