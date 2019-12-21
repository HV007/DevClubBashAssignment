#!/bin/bash
FILE=$1
NAME=$2
index=0
if [ -z "$FILE" ] || [ -z "$NAME" ]
then
	exit -1
fi

while IFS= read -r line
do
	#echo "$line"
	array[$index]="$line"
	((index++))
done < "$FILE"

flag=0
for element in "${array[@]}"
do
	IFS=':' 
	#echo "$element"
	read -ra arr <<< "$element"
	IFS=' '
	#echo "${arr[*]}"
	if [[ ${arr[0]} = $NAME ]]
	then
		echo "${arr[4]}"
		flag=1
		break
	fi
done

if [ flag == 0 ]
then 
	exit -1
fi
