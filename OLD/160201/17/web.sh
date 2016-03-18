#!/bin/bash
# Purpose: A Shell Script To Create Webalizer Stats Configration File
# Written by: Vivek Gite
# ---------------------------------------------------------------------
# Set vars
 
# Apache vroot for each domain
HTTPDROOT="/home/httpd"
 
# Path to GeoIP DB
GEOIPDBPATH="/usr/local/share/GeoIP/GeoIP.dat"
 
# Get the Internet domain such as cyberciti.biz 
echo "*** A Shell Script To Create Webalizer Stats Configration File ***"
read -p "Enter a domain name : " DOMAIN
 
# Make sure we got the Input else die with an error on screen
[ -z $DOMAIN ] && { echo "Please enter a domain name. Try again!"; exit 1; }
 
# Alright, set some variable based upon $DOMAIN 
OUT="$HTTPDROOT/$DOMAIN/stats/webalizer.conf"
CONFROOT="$HTTPDROOT/$DOMAIN/stats"
LOGFILE="$HTTPDROOT/$DOMAIN/logs/access.log"
 
# Die if configuration file exits...
[ -f $OUT ] && { echo "Webalizer configuration file '$OUT' exits for domain $DOMAIN."; exit 2; }
 
# Make sure configuration directory exists
[ ! -d $CONFROOT ] && mkdir -p $CONFROOT 
 
# Write a log file 
 
>$OUT
echo "LogFile $LOGFILE"  >> $OUT
echo "LogType clf"  >> $OUT
echo "OutputDir     $CONFROOT/out"  >> $OUT
echo "HistoryName     $CONFROOT/webalizer.hist"  >> $OUT
echo "Incremental     yes"  >> $OUT
echo "IncrementalName $CONFROOT/webalizer.current"  >> $OUT
echo "HostName       $DOMAIN"  >> $OUT
echo "Quiet           yes"  >> $OUT
echo "FoldSeqErr      yes"  >> $OUT
echo "AllSearchStr    yes"  >> $OUT
echo "HideSite        $DOMAIN"  >> $OUT
echo "HideSite        localhost"  >> $OUT
echo "HideReferrer    $DOMAIN"  >> $OUT
echo "HideURL         *.gif"  >> $OUT
echo "HideURL         *.GIF"  >> $OUT
echo "HideURL         *.jpg"  >> $OUT
echo "HideURL         *.JPG"  >> $OUT
echo "HideURL         *.png"  >> $OUT
echo "HideURL         *.PNG"  >> $OUT
echo "HideURL         *.ra"  >> $OUT
echo "GroupReferrer   yahoo.com/      Yahoo!"  >> $OUT
echo "GroupReferrer   excite.com/     Excite"  >> $OUT
echo "GroupReferrer   infoseek.com/   InfoSeek"  >> $OUT
echo "GroupReferrer   webcrawler.com/ WebCrawler"  >> $OUT
echo "SearchEngine    .yahoo.         p="  >> $OUT
echo "SearchEngine    altavista.com   q="  >> $OUT
echo "SearchEngine    .google.        q="  >> $OUT
echo "SearchEngine    eureka.com      q="  >> $OUT
echo "SearchEngine    lycos.com       query="  >> $OUT
echo "SearchEngine    hotbot.com      MT="  >> $OUT
echo "SearchEngine    msn.com         MT="  >> $OUT
echo "SearchEngine    infoseek.com    qt="  >> $OUT
echo "SearchEngine    webcrawler      searchText="  >> $OUT
echo "SearchEngine    excite          search="  >> $OUT
echo "SearchEngine    netscape.com    search="  >> $OUT
echo "SearchEngine    mamma.com       query="  >> $OUT
echo "SearchEngine    alltheweb.com   query="  >> $OUT
echo "SearchEngine    northernlight.com  qr="  >> $OUT
echo "CountryFlags yes"  >> $OUT
echo "GeoIP yes"  >> $OUT
echo "GeoIPDatabase $GEOIPDBPATH"  >> $OUT
echo "GraphMonths 72"  >> $OUT
echo "IndexMonths 120"  >> $OUT
echo "GraphMonths 72"  >> $OUT
echo "TopReferrers 20"  >> $OUT
echo "TopSites 20"  >> $OUT
echo "TopURLs 50"  >> $OUT
echo "TopKURLs 50"  >> $OUT
 
echo "Weblizer config wrote to $OUT"
