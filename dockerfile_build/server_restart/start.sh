#!/bin/bash

if [ $PORT ];then
	echo "PORT = $PORT"
else
	PORT=443
fi

if [[ $HOST ]]
then
	echo "Start traffic track agent: $HOST"
	sh /home/stat.sh &
fi

curl https://proxyservices.azurewebsites.net/api/RandomPwd?code=$APPKEY > temp
temp2=`cat temp`
ssserver -s 0.0.0.0 -p $PORT -k $temp2 &
pwdDate=`TZ=UTC-5 date +%m%d`

while true
do
	currentDate=`TZ=UTC-5 date +%m%d`
	minute=`TZ=UTC-5 date +%H`
	if [[ $currentDate != $pwdDate ]]
	then
		#pkill -f ssserver
		curl https://proxyservices.azurewebsites.net/api/RandomPwd?code=$APPKEY > temp
		returncode=`echo $?`
		if [[ $returncode == 0 ]]
		then
			pkill -f ssserver
			temp2=`cat temp`
			ssserver -s 0.0.0.0 -p $PORT -k $temp2 &
			pwdDate=`TZ=UTC-5 date +%m%d`
			echo "Password updated for $pwdDate"
		else
			echo "Update password failed, wait for retry"
		fi		
	fi
#	echo "$currentDate $pwdDate $minute"
	sleep 20
done	
