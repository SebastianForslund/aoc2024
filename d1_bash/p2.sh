#!/bin/bash

INPUT=$(cat ../inputs/d1p1.txt)

COL1="$(echo "$INPUT" | awk '{print $1}')"
COL2="$(echo "$INPUT" | awk '{print $2}')"

echo "$COL1"

SIM=0
INDEX=1

echo "$COL1" | while read CURR
do
	echo "curr: "$CURR""
	INDEX=$(($INDEX+1))
	echo "i: $INDEX"
	MUL=$(echo "$COL2" | grep $CURR | wc -l)
	echo "mul: $MUL"
	
	if [ $MUL -gt 0 ];
	then
		SCORE=$(($MUL*$CURR))
		echo "mul: $MUL"
		echo "nbr: $CURR"
		echo "scr: $SCORE"
		SIM=$(($SIM+$SCORE))
		echo "current sim: $SIM"
	fi

done


