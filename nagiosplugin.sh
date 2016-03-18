#!/bin/bash
SAR_OUTPUT=`sar 1 3 | grep -i average`

USER=`echo $SAR_OUTPUT  | awk '{print $3}'`
NICE=`echo $SAR_OUTPUT  | awk '{print $4}'`
SYS=`echo $SAR_OUTPUT   | awk '{print $5}'`
IOWAIT=`echo $SAR_OUTPUT   | awk '{print $6}'`
STEAL=`echo $SAR_OUTPUT   | awk '{print $7}'`
IDLE=`echo $SAR_OUTPUT   | awk '{print $8}'`

INTUSER=`echo $USER | cut -d "." -f 1`
INTNICE=`echo $USER | cut -d "." -f 1`
INTSYS=`echo $USER | cut -d "." -f 1`
INTIOWAIT=`echo $USER | cut -d "." -f 1`
INTSTEAL=`echo $USER | cut -d "." -f 1`


warn=80
crit=90

if [ "$INTUSER" -lt "$warn" -a "$INTNICE" -lt "$warn" -a "$INTSYS" -lt "$warn" -a "$INTIOWAIT" -lt "$warn" -a "$INTSTEAL" -lt "$warn" ]
then
    STATUS="OK"
    EXIT=0
elif [ "$INTUSER" -ge "$warn" -o "$INTNICE" -ge "$warn" -o "$INTSYS" -ge "$warn" -o "$INTIOWAIT" -ge "$warn" -o "$INTSTEAL" -ge "$warn" ]
then
    if [ "$INTUSER" -ge "$crit" -o "$INTNICE" -ge "$crit" -o "$INTSYS" -ge "$crit" -o "$INTIOWAIT" -ge "$crit" -o "$INTSTEAL" -ge "$crit" ]
    then
    STATUS="CRITICAL"
    EXIT=2
    else
    STATUS="WARNING"
    EXIT=1
    fi
else
    STATUS="UNKNOWN"
    EXIT=3
fi

