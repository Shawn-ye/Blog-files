#!/bin/bash

#containerid=`cat /etc/hostname`
containerid=`cat /proc/1/cgroup | grep 'docker/' | tail -1 | sed 's/^.*\///' | cut -c 1-12`
touch /home/tx_bytes



while true
do
    txbytesFromFile=`cat /home/tx_bytes`
    txbytes=`cat /sys/class/net/eth0/statistics/tx_bytes`
    if [[ $txbytes != txbytesFromFile ]]
    then
        curl 'https://proxyservices.azurewebsites.net/api/TrafficStat?code=$APPKEY&containerid=$containerid&host=$HOST&bytes=$txbytes&port=$PORT'
        echo $txbytes > /home/tx_bytes
        echo "https://proxyservices.azurewebsites.net/api/TrafficStat?code=$APPKEY&containerid=$containerid&host=$HOST&bytes=$txbytes&port=$PORT"
        echo "Report success, $txbytes, $"
    else
        echo "Skipped reporting as no delta in transmitted bytes."
    fi
    sleep 300
done

