#!/bin/bash
E_WRONG_ARGS=85
Script_parameters="-a -h -l -p"

if [ $# -ne $Number_of_expected_args ]
then
 echo "Usage: `basename $0`  $Script_parameters"
exit $E_WRONG_ARGS
fi 
