#!/bin/bash
#The first script
echo "Current date: $(date)@$(hostname)"
echo "Network configuration"
ifconfig 
/bin/netstat -rn
