**sslocal** This image will perform a restart to upgrade password on every 3:00 AM (UTC+8).

* SOCKS_PORT: Local listening socks port

* APPKEY: specify a appkey
* SERVER: target server address

*Run in service mode*
```
docker service create --replicas=3 -p {SOCKS_PORT}:1234 -e SERVER={} -e APPKEY={} shawnye90/ssrasp-new
```
*Run in host network mode*
```
docker run -d --restart=always --net=host -e PORT={} -e SERVER={} -e APPKEY={} shawnye90/ssrasp-new
```
