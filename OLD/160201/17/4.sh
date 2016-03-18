#!/bin/bash
echo -n "In what year were you born?> "
read year
if [ $year -gt `date +%y` ]
then 
   echo "Sorry, but that's just not possible."
 exit 2
fi
