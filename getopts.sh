#!/bin/bash
while getopts "h:s:" arg; do
  case $arg in
    h)
      echo "usage" 
      ;;
    s)
      strength=$OPTARG
      echo $strength
      ;;
  esac
done
