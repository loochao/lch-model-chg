#!/bin/bash
echo '----------------'
echo 'Simulating sigma_eta = 0.00019;'
echo '----------------'
echo 'double sigma_eta = 0.00019;' > sigma_eta.h

echo '--------'
echo 'Simulating p1_sigma = 0.088'
echo '--------'
echo 'double p1_sigma = 0.088 * 2;' > p1_sigma.h
gcc -Wall dan_eqn.c -o dan_eqn
dan_eqn

echo '--------'
echo 'Simulating p1_sigma = 0.0088'
echo '--------'
echo 'double p1_sigma = 0.88 * 2;' > p1_sigma.h
gcc -Wall dan_eqn.c -o dan_eqn
dan_eqn

# echo '----------------'
# echo 'Simulating sigma_eta = 0.0019;'
# echo '----------------'
# echo 'double sigma_eta = 0.0019;' > sigma_eta.h

# echo '--------'
# echo 'Simulating p1_sigma = 0.88'
# echo '--------'
# echo 'double p1_sigma = 0.88 * 2;' > p1_sigma.h
# gcc -Wall dan_eqn.c -o dan_eqn
# dan_eqn

# echo '--------'
# echo 'Simulating p1_sigma = 0.088'
# echo '--------'
# echo 'double p1_sigma = 0.088 * 2;' > p1_sigma.h
# gcc -Wall dan_eqn.c -o dan_eqn
# dan_eqn

echo '----------------'
echo 'Simulating sigma_eta = 0.019;'
echo '----------------'
echo 'double sigma_eta = 0.019;' > sigma_eta.h

echo '--------'
echo 'Simulating p1_sigma = 0.88'
echo '--------'
echo 'double p1_sigma = 0.88 * 2;' > p1_sigma.h
gcc -Wall dan_eqn.c -o dan_eqn
dan_eqn

# echo '--------'
# echo 'Simulating p1_sigma = 0.088'
# echo '--------'
# echo 'double p1_sigma = 0.088 * 2;' > p1_sigma.h
# gcc -Wall dan_eqn.c -o dan_eqn
# dan_eqn
