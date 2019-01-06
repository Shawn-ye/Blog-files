const net = require('net');
//const host = "40.115.154.71";
const host = "13.75.71.45";

let ts = Date.now();
const client = net.createConnection({ host: host, port: 443}, () => {
  //'connect' listener
  console.log((Date.now() - ts) / 1.5, 'ms');
  client.destroy();
});
