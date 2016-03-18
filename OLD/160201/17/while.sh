#!/bin/bash
MAXCOUNT=10
COUNT=1
echo
echo "$MAXCOUNT random numbers:"
echo "----------------------------------"
while [ "$COUNT" -le "$MAXCOUNT" ]
do 
    number=$RANDOM
     echo $number
  let "count += 1"  # Increment count.
done
