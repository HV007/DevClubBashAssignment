#!/bin/bash
FILE=$1
ans=0
index=0
while IFS= read -r line
do
	#echo "$line"
	array[$index]="$line"
	((index++))
done < "$FILE"
for element in "${array[@]}"
do
	IFS=' ' 
	#echo "$element"
	read -ra arr <<< "$element"
	num=${arr[0]}
	op=${arr[1]}
	if [ $op == '+' ]
	then
		((ans+=num))
	elif [ $op == '-' ]
	then	
		((ans-=num))
	elif [ $op == 'x' ]
	then 
		((ans*=num))
	elif [ $op == '/' ]
	then 
		((ans/=num))
	fi
done

echo $ans