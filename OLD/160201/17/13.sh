#!/bin/bash
echo "This script is used to check the existance of the message file."
echo "Checking ................"
MESG="/var/log/messages"
sleep 3
if [ ! -f $MESG ]
then 
  echo "File dose not exist"
else 
  echo "File exist"
fi
echo
echo "..........done"
