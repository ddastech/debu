#!/bin/bash
Username=$1
if [ $# -eq 0 ]
then 
 exit 123
fi
getent passwd  $Username  > /dev/null
if [ $? -eq 0 ]
then 
  echo "User found :- $Username"
else 
  echo "User not found :- $Username"
 exit 1
fi
