#!/bin/bash
SRCD="/etc/"
TGTD="/var/Backup"
if [ ! -d $TGTD ]
then
  mkdir -p $TGTD && echo Target directory created : $TGTD
else
  echo Already exist: $TGTD
fi 
cd $TGTD
OF=home-$(date +%Y%m%d).tgz
tar -cZf $TGTD$OF $SRCD

exit 56
