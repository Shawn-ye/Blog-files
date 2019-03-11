#!/bin/bash

containerid=`cat /proc/self/cgroup | grep -o  -e "docker-.*.scope" | head -n 1 | sed "s/docker-\(.*\).scope/\\1/"`
txbytes=`cat /sys/class/net/eth0/statistics/tx_bytes`


while true
do
    sleep 300
    curl 'https://proxyservices.azurewebsites.net/api/TrafficStat?code=$APPKEY&containerid=$containerid&bytes=$txbytes&port=$PORT'
done

