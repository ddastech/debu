#!/bin/bash

if [ $# -ge 1 ] && [ -d $1 ]
then
for file in `ls $1`
do
if [ $debug == "on" ] 
then 
  echo working on $file
fi
 wc -l $1/$file
done
else 
 echo "Usage: `basename $0` directory"
 exit 1
fi
 
