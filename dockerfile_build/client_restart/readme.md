**sslocal** This image will perform a restart to upgrade password on every 3:00 AM (UTC+8).

* APPKEY: specify a appkey
* SERVER: target server address


```
docker service create --replicas=2 -e SERVER={} -e APPKEY={} shawnye90/client_restart
```
