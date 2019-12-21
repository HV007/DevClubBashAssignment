#!/bin/bash
dir=$1
ext=$2
if [ -z "$ext" ]
then
  count=0
  for file in $dir/*
  do
    if [ -f "$file" ]
    then
      ((count++))
    fi
  done
else
  count=0
  for file in $dir/*.$ext
  do
    ((count++))
  done
fi
echo $count