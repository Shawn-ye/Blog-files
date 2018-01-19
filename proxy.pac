// function FindProxyForURL(url, host) { 
//     return "SOCKS 192.168.128.74:8888"; 
// }

function FindProxyForURL(url, host) {
    var DIRECT_LIST = ["baidu", "aliyun", "taobao", "csdn", "zhihu", "163", "ecouser.net", "10.88.", "192.168.", "121.41.72.156", "118.178.152.136", "gov"];

    for (var i in DIRECT_LIST)  {
        if (shExpMatch(url, "*" + DIRECT_LIST[i] + "*")) {
            return "DIRECT";
        }
    }

    
    // All other requests go through port 8080 of proxy.example.com.
    // should that fail to respond, go directly to the WWW:
    // var ran = Math.random();
    
    return "SOCKS 192.168.98.141:8888; DIRECT"; 
}