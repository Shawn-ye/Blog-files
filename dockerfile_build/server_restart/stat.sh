#!/bin/bash

containerid=`cat /etc/hostname`



while true
do
    txbytes=`cat /sys/class/net/eth0/statistics/tx_bytes`
    curl 'https://proxyservices.azurewebsites.net/api/TrafficStat?code=$APPKEY&containerid=$containerid&bytes=$txbytes&port=$PORT'
    sleep 300
done

