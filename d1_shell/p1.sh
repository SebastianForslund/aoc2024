#!/bin/bash

INPUT=$(cat ../inputs/d1p1.txt)

COL1="$(echo "$INPUT" | awk '{print $1}')"
COL2="$(echo "$INPUT" | awk '{print $2}')"


SRT1=$(echo "$COL1" | sort)
SRT2=$(echo "$COL2" | sort)

# Now they all ended up on one line... put them on one line
# each again so i can easily loop thru them
SRT1="$(echo "$SRT1" | xargs -n 1 echo)"
SRT2="$(echo "$SRT2" | xargs -n 1 echo)"
echo "$SRT1"

SUM=0
INDEX=1

echo "$SRT1" | while read C1
do
	#echo "c1: "$C1""
	C2="$(echo "$SRT2" | sed -n ''$INDEX'p')"
	#echo "c2: "$C2""
	INDEX=$(($INDEX+1))
	echo "i: $INDEX"
	DIFF=$(("$C1"-"$C2"))
	# remove the - sign if needed lolz
	DIFF=$(echo "${DIFF/-/}")
	echo "diff: $DIFF"
	SUM=$(($SUM+$DIFF))
	echo "sum: $SUM"
done

