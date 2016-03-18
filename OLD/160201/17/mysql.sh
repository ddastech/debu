*******************************************************************************
status=0
MasterHost="192.168.0.223"
SlaveHost="192.168.0.12"
emails="support@mydomain.com" #multiple emails space separated
DownSubject="Replication status - Down"
GoodSubject="Replication status - Good"
GoodMessage="Everything regarding MySQL replication on $SlaveHost is good.\nHave a great day!\n\n"

#Grab the lines for each and use Gawk to get the last part of the string(Yes/No)
SQLresponse=`mysql -u root --password=password test -e "show slave status \G" |grep -i "Slave_SQL_Running"|gawk '{print $2}'`
IOresponse=`mysql -u root --password=password test -e "show slave status \G" |grep -i "Slave_IO_Running"|gawk '{print $2}'`


if [ "$SQLresponse" = "No" ]; then
error="Replication on the slave MySQL server($SlaveHost) has stopped working.\nSlave_SQL_Running: No\n. \nTrying to start it\n"
status=1
mysqladmin --user=root --password=password start-slave
fi

if [ "$IOresponse" = "No" ]; then
error="Replication on the slave MySQL server($SlaveHost) has stopped working.\nSlave_IO_Running: No\n. \nTrying to start it\n "
status=1
mysqladmin --user=root --password=password start-slave
fi

# If the replication is not working
if [ $status = 1 ]; then
for address in $emails; do
# echo -e $error | mail -s $DownSubject $address
echo -e $error | mail -s "Replication is Down" $address
echo "Replication down, sent email to $address"
done
fi

# If the replication is working fine
if [ $status = 0 ]; then
for address in $emails; do
# echo -e $GoodMessage | mail -s $GoodSubject $address
#echo -e $GoodMessage | mail -s "Replication is UP" $address
echo "Replication is up, still sent email to $address"
done
fi
