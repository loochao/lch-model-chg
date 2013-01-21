set terminal png
set output "snapshot_52.png"
set xlabel "x (micron)"
set ylabel "height (micron)"
set yrange [0:5]
set title "snapshot_52"
plot "snapshot_52.dat" using 1 with lines
