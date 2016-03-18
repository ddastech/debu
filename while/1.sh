#!/bin/bash
BASHDIR=/root/satya
BASHOLDDIR=/root/satya/OLD
while true; do
   DATE=`date +%y%m%d`
   HOUR=`date +%H`
   mkdir $BASHOLDDIR/"$DATE"
while [ $HOUR -ne "00" ]; do
      DEST=$BASHOLDDIR/"$DATE"/"$HOUR"
      mkdir -p $DEST
      mv $BASHDIR/*.sh "$DEST"/
      sleep 3
      HOUR=`date +%H` 
done

done  
