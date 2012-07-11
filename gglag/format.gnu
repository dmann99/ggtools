# Format File for GGLag Graph System
# David Mann
# 01-JAN-2007 Created
# 21-MAR-2012 Tidied up for release 0.9

set terminal png
set output "plots/DATE-LagTime-INSTANCE.png"

set title "GG Lag Time for INSTANCE - DATE"

set xdata time
set xlabel "Time Of Day"
set xtics rotate

set ylabel "Lag Time in Minutes"
set ytics 30
set mytics 6
set yrange [-5:180]

set grid ytics xtics

set timefmt "%Y-%m-%d-%H:%M"

# The series you want to plot must be hardcoded here
# List the Extract and Replicat names as shown here for as many series 
# as you would like to show up on the graph
plot \
"< cat data/ggsdataDATE.txt | grep REP1" using 2:3 with lines title "REP1",\
"< cat data/ggsdataDATE.txt | grep EXT1" using 2:3 with lines title "EXT1"

