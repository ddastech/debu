#!/bin/bash

# This script copies files from my homedirectory into the webserver directory.
# (use scp and SSH keys for a remote directory)
# A new directory is created every hour.

PICSDIR=/var/log
WEBDIR=/var/www/carol/webcam

while true; do 
	DATE=`date +%Y%m%d`
	HOUR=`date +%H`
	mkdir -p  $WEBDIR/"$DATE"
	
	while [ $HOUR -ne "00" ]; do 
		DESTDIR=$WEBDIR/"$DATE"/"$HOUR"
		mkdir "$DESTDIR"
		cp  $PICDIR/*.log  "$DESTDIR"/
		sleep 3600
		HOUR=`date +%H`
	done
done
