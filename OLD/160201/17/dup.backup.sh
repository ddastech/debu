#!/bin/bash
# A sample shell script to backup MySQL database

# Get todays date
NOW=$(date +"%d-%m-%Y")

# Location to store mysql backup
BAK="/nas10/.mysql-database"

# MySQL Server Login Information
MUSER="root"			#### mysql user name ###
MPASS="newpwd"	                #### mysql password  ###
MHOST="127.0.0.1"		#### mysql host name ###

# Full path to common utilities
MYSQL="/usr/bin/mysql"
MYSQLDUMP="/usr/bin/mysqldump"
GZIP="/bin/gzip"

# If backup directory does not exits create it using logical not
if [ ! -d "$BAK" ]
then
  mkdir -p "$BAK"
fi

# Get all mysql databases names
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
echo $DBS
echo $"-------------"
# Start backup
echo -n "Dumping..."

# Use the for loop
for db in $DBS
do
echo $db
echo $"*******************************"
 FILE="$BAK/mysql-$db.$NOW-$(date +"%T").gz"
echo $FILE
echo $"======================================"
  $MYSQLDUMP -u $MUSER -h $MHOST -p$MPASS $db | $GZIP -9 > $FILE
echo $db
echo $"2222222222222222222222"
 echo -n "."
done
echo -n  "...Done"
echo ""
