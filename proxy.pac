// function FindProxyForURL(url, host) { 
//     return "SOCKS 192.168.128.74:8888"; 
// }

function FindProxyForURL(url, host) {
    var DIRECT_LIST = ["baidu", "aliyun", "taobao", "csdn", "zhihu", "163", "cnblogs", ".cn", "autoimg", "10.88.", "192.168.", "gov"];

    for (var i in DIRECT_LIST)  {
        if (shExpMatch(url, "*" + DIRECT_LIST[i] + "*")) {
            return "DIRECT";
        }
    }

    
    // All other requests go through port 8080 of proxy.example.com.
    // should that fail to respond, go directly to the WWW:
    // var ran = Math.random();
    alert(url); 
    return "SOCKS 127.0.0.1:7777; SOCKS 127.0.0.1:8888; SOCKS 127.0.0.1:9999; DIRECT"; 
}
