<?php
namespace Jakubkulhan;

use React\EventLoop\Factory as EventLoopFactory;
use React\Http\Request;
use React\Http\Response;
use React\Socket\Server as SocketServer;
use React\Http\Server as HttpServer;

require __DIR__ . "/vendor/autoload.php";

$loop = EventLoopFactory::create();
$socket = new SocketServer($loop);
$http = new HttpServer($socket);

$http->on("request", function (Request $req, Response $res) {
	$res->writeHead(200);
	$res->end(round(microtime(true) * 1000));
});

$port = intval($argv[1]);
$socket->listen($port);
echo "Listening on $port.\n";

$loop->run();
