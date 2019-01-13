pwdDate=`TZ=UTC-5 date +%m%d`
currentDate=`TZ=UTC-5 date +%m%d`

        minute=`TZ=UTC-5 date +%H`
	echo $pwdDate
	echo $currentDate
	echo $minute
        if [[ currentDate != $pwdDate ]] && [[ minute == "00" ]]
        then
                pkill -f sslocal
                curl https://proxyservices.azurewebsites.net/api/RandomPwd?code=$APPKEY > temp
                temp2=`cat temp`
                #ssserver -s 0.0.0.0 -p 443 -k $temp2 &
                sslocal -s $SERVER -p 443 -b 0.0.0.0 -l 1234 -k $temp2 &
                pwdDate=`TZ=UTC-5 date +”%m%d`
                echo "Password updated for $pwdDate"
        fi
