#!/bin/sh
clear
read -p "Enter server address: " svr_addr

echo
read -p "Enter server port, leave blank for default 443: " svr_port
svr_port=${svr_port:-443}

echo
read -p "Enter password, leave blank for default: " passwd
passwd=${passwd:-asdfgh61022}

echo 
read -p "Enter local socks port: " port

echo
read -p "Enter number of replicas, leave blank for default 4: " rep
rep=${rep:-4}




