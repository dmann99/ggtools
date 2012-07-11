#!/bin/sh

# David Mann

# This script runs the ggsci utility and saves data about running processes to a file

# 01-JAN-2007 Created
# 21-MAR-2012 Tidied up for release 0.9

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Variables
TODAY=$(date +%Y-%m-%d)
CURTIME=$(date +%H:%M)

# Run GGSCI and get screen output
$GGSDIR/ggsci > test.txt <<EOF
INFO ALL
EXIT
EOF

# Get relevant lines from output
# The sed expression extracts the output from the raw screen scrape. 
# The awk expression formats the output and converts the times into minutes. 
# Finally the output is appended to a file with a separate file for data
# gathered on each day
cat test.txt | grep ":" | grep "RUNNING" \
  | sed s/"^[A-Z]*[ ]*[A-Z]*[ ]*\([A-Za-z0-9]*\)[ ]*\([0-9]*\)[:]\([0-9]*\).*$"/"\1 $TODAY-$CURTIME \2 \3"/ \
| awk '{print $1, $2, ($3*60)+$4}' \
>> $MONITORDIR/gglag/data/ggsdata$TODAY.txt

rm test.txt

# Go ahead and generate the graph since it doesn't take much resources
cd $MONITORDIR/gglag
cat format.gnu | sed s/DATE/$TODAY/ | sed s/INSTANCE/$ORACLE_SID/ | gnuplot

