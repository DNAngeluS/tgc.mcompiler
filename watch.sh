#!/bin/sh

event=$1
directory=$2
file=$3
filename="${directory}/${file}"

echo "Initilizing Effect compiling for ${filename} on event ${event}";
# run some command based on an event
case $event in
  w) /home/wine/compiler.sh $filename;;
  *) echo "Nothing to do.";;
esac