#!/bin/bash
curl https://proxyservices.azurewebsites.net/api/RandomPwd?code=$APPKEY > temp
temp2=`cat temp`

sslocal -s $SERVER -p 443 -b 0.0.0.0 -l 1234 -k $temp2 &
pwdDate=`TZ=UTC-5 date +%m%d`

while true
do
        currentDate=`TZ=UTC-5 date +%m%d`
        if [[ $currentDate != $pwdDate ]]
        then
                curl https://proxyservices.azurewebsites.net/api/RandomPwd?code=$APPKEY > temp
                returncode=`echo $?`
                if [[ $returncode == 0]]
                then
                    temp2=`cat temp`
                    pkill -f sslocal
                    sslocal -s $SERVER -p 443 -b 0.0.0.0 -l 1234 -k $temp2 &
                    pwdDate=`TZ=UTC-5 date +%m%d`
                    echo "Password updated for $pwdDate"
                else
                    echo "Update password failed, wait for retry"
                fi
        fi
        echo "$currentDate $pwdDate $minute"
        sleep 20
done
