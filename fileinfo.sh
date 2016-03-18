#!/bin/bash
Files="/usr/sbin/accept
/usr/sbin/pwck
/usr/sbin/chroot
/usr/bin/fakefile
/sbin/badblocks
/sbin/ypbind"
echo 

for file in $Files
do 
if [ ! -e "$file" ]
then
echo "#file doesn't exist."
continue
fi
ls -l $file | awk '{ print $8 "         file size: " $5 }'
whatis `basename $file`   
echo 
done
exit 23
