//var http = require('http');
//var fs = require('fs');
//var index = fs.readFileSync('index.html');
//var xmlFile = fs.readFileSync('hochschule.xml');
//
//http.createServer(function (req, res) {
//    res.writeHead(200, { 'Content-Type': 'text/html' });
//    res.write(index);
//    res.end();
//}).listen(1338);


var connect = require('connect');
connect.createServer(
    connect.static('./server')
).listen(1337);