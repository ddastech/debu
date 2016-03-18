#!/bin/bash
SUCESS=0
E_noargs=234

if [ -z "$1" ]
then
echo "Usage: `basename $0` rpm files"
exit $E_noargs
fi
{ #Begin code blocks
echo "......................................................."
echo "Archive Description:"
rpm -qi $1
echo 
echo "Archive Listing:"
  rpm -ql $1       # Query listing.
  echo
rpm -i --test $1 
if [ $? -eq $SUCESS  ]
then
echo $1 can be installed sucessfully.
else
echo $1 can not  be installed sucessfully.
fi
echo
} > "$1.test"

echo "Results of rpm test in file $1.test"
exit 0
