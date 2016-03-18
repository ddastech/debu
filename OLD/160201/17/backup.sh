#!/bin/bash
#This is a backup script
#Get today's date
NOW=$(date + "%d-%m-%y")

#Location to store mysqlbackup
BAK="/nas10/.mysql-database"

#mysql server login information
MUSER="root"
MPASSWD="newpwd"
MHOST="127.0.0.1"

#Full path to mysql utilities
MYSQL="/usr/bin/mysql"
MYSQLDUMP="/usr/bin/mysqldump"
ZIP="/bin/gzip"
#If backup directory doesn't exist

if [ ! -d $BAK ]
then
   mkdir -p $BAK
fi
#Get all mysql databases names
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASSWD -Bse 'show databases')"

#start backup

echo -n "Dumping ................"

for db in $DBS
do 
FILE="$BAK/mysql-$db.$NOW-$(date +"%T").gz"
    $MYSQLDUMP -u $MUSER -h $MHOST -p$MPASS $db | $GZIP -9 > $FILE
 echo -n "."
 done

echo -n  "...Done"
echo ""

