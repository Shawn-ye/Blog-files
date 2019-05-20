var proxy = require('express-http-proxy');
var fs = require('fs');
var http = require('http');
var https = require('https');

let cfgs = JSON.parse(fs.readFileSync("config.json"));
let serverObjects = [];

// {
//     "port": 443,
//     "https": true,
//     "cert": "",
//     "privateKey": "",
//     "proxyRules": {
//         "/": "http://www.baidu.com"
//     }
// },

for (let cfg of cfgs.webServers)
{
    console.log(cfg);
    if (cfg.https === true)
    {
        let app = require("express")();
        let credentials = {
            key: fs.readFileSync(cfg.privateKey),
            cert: fs.readFileSync(cfg.cert)
        }
        for (let key in cfg.proxyRules)
        {
            app.use(key, proxy(cfg.proxyRules[key]));
            console.log(key, "=>", cfg.proxyRules[key]);
        }
        let httpsServer = https.createServer(credentials, app);
        httpsServer.listen(cfg.port, () => {
            console.log("HTTPS running at", cfg.port)
        })
    }
    else {
        let app = require("express")();
        for (let key in cfg.proxyRules)
        {
            app.use(key, proxy(cfg.proxyRules[key]));
            console.log(key, "=>", cfg.proxyRules[key]);
        }
        let httpsServer = http.createServer(app);
        httpsServer.listen(cfg.port, () => {
            console.log("HTTP running at", cfg.port)
        })        
    }
}


// var privateKey  = fs.readFileSync('/path/to/private.pem', 'utf8'),
// var certificate = fs.readFileSync('/path/to/file.crt', 'utf8');
// var credentials = {key: privateKey, cert: certificate};

// var httpServer = http.createServer(app);
// var httpsServer = https.createServer(credentials, app);
// var PORT = 8000;
// var SSLPORT = 8001;

// httpServer.listen(PORT, function() {
//     console.log('HTTP Server is running on: http://localhost:%s', PORT);
// });
// httpsServer.listen(SSLPORT, function() {
//     console.log('HTTPS Server is running on: https://localhost:%s', SSLPORT);
// });

// // Welcome
// app.get('/', function(req, res) {
//     if(req.protocol === 'https') {
//         res.status(200).send('Welcome to Safety Land!');
//     }
//     else {
//         res.status(200).send('Welcome!');
//     }
// });