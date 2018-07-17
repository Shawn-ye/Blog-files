#!/bin/sh
clear
read -p "Enter server address: " svr_addr

echo
read -p "Enter service name: " svc_name

echo
read -p "Enter local socks port: " port

echo
read -p "Enter server port, leave blank for default 443: " svr_port
svr_port=${svr_port:-443}

echo
read -p "Enter password, leave blank for default: " passwd
passwd=${passwd:-asdfgh61022}

echo
read -p "Enter number of replicas, leave blank for default 4: " rep
rep=${rep:-4}


docker service create --replicas $rep --name $svc_name -p $port:8888 -e SERVER=$svr_addr -e PASSWORD=$passwd -e PORT=$svr_port -e SOCKS_BIND_ADDR=0.0.0.0 -e SOCKS_PORT=8888 shawnye90/ss-raspberry:latest /bin/sh -c "cd /home && chmod +x start.sh && ./start.sh"




