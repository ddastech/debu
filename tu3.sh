#!/bin/bash
for i in "mars 30" "moon 20" "pluto 50"
do
set -- $i
echo $1       $2,0000000000 miles from earth
done
exit 23
