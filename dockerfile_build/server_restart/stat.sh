#!/bin/bash

containerid=`cat /etc/hostname`
touch /home/tx_bytes



while true
do
    txbytesFromFile=`cat /home/tx_bytes`
    txbytes=`cat /sys/class/net/eth0/statistics/tx_bytes`
    if [[ $txbytes != txbytesFromFile ]]
    then
        curl 'https://proxyservices.azurewebsites.net/api/TrafficStat?code=$APPKEY&containerid=$containerid&host=$HOST&bytes=$txbytes&port=$PORT'
        echo $txbytes > /home/tx_bytes
        echo "Report success, $txbytes"
    else
        echo "Skipped reporting as no delta in transmitted bytes."
    fi
    sleep 300
done

