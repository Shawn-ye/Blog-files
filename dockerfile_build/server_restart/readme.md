**ssserver** This image will perform a restart to upgrade password on every 3:00 AM (UTC+8).

* APPKEY: specify a appkey

```
docker service create -p 443:443 --replicas=2 -e APPKEY={} shawnye90/server_restart
```
