#!/bin/bash
echo 'initializing display changer'
selfId=$RANDOM
echo "selfId $selfId"
echo "$selfId" >> /tmp/displayChangerId
files=(res/*)
echo "${#files[@]}"
LEN="${#files[@]}"
DELAY="15s"

count=$((LEN))
while :
do
	count=$((count-1))
	if [ $count -eq -1 ]
	then 
		count=$((LEN-1));
	fi
	index=$(($RANDOM%$LEN))
	echo "index $index"
	echo "$count"
	echo "${files[$count]}"
	#pwd
	path="${PWD}/${files[${index}]}"
	echo "$path"

	gsettings set org.gnome.desktop.background picture-uri file://"${path}"
	
	sleep ${DELAY}
done
