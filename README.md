# Hit server bench

Comparison of raw HTTP hit performance of:

- [Node.js](http://nodejs.org)
- [Spray (Scala)](http://spray.io)
- [Erlang HTTP server](http://erlang.org/doc/apps/inets/http_server.html)
- [Http-kit (Clojure)](http://http-kit.org/index.html)
- [Warp (Haskell)](http://hackage.haskell.org/package/warp)
- [Tornado](http://www.tornadoweb.org/en/stable/)
- [Puma (Ruby)](http://puma.io/)

## Results

See `*-results.txt` for `wrk` benchmark results.

### Requests per second

| Environment          | Req/s (c=1) | Req/s (c=10) | Req/s (c=50) | Req/s (c=100) |
|----------------------|------------:|-------------:|-------------:|--------------:|
| Node.js              |    10215.47 |     38447.10 |     51362.60 |      52722.19 |
| Spray                |    10681.03 |     41761.57 |     50912.04 |      52746.62 |
| Erlang               |       24.70 |       246.98 |      1240.38 |       2474.18 |
| Http-kit             |     8789.63 |     61355.26 |     73457.67 |      73475.39 |
| Warp                 |    12467.62 |     41547.37 |     53475.75 |      53864.91 |
| Tornado              |     2356.82 |      4590.33 |      4422.08 |       4155.61 |
| Puma                 |    10048.54 |     19289.60 |     16280.00 |      16698.86 |
| Netty                |    28409.44 |    116605.01 |    186109.06 |     180001.91 |
| Spark (Jetty)        |    10982.23 |     44533.38 |     31624.97 |      57425.96 |
| Spring Boot (Tomcat) |     2652.85 |     13450.45 |     26336.17 |      31288.19 |
| Reactor              |    12899.17 |     50113.60 |     66310.16 |      65718.33 |
| PHP-FPM              |     2907.34 |      9968.78 |      9004.46 |       9425.08 |
| HHVM                 |     1323.99 |      6434.97 |      9192.72 |       9743.09 |
| ReactPHP (PHP)       |     1636.49 |      9454.17 |     13676.61 |      12061.91 |
| ReactPHP (HHVM)      |     2087.04 |     12185.55 |     16151.42 |      12036.11 |


### Average latency

| Environment          | Latency (c=1) | Latency (c=10) | Latency (c=50) | Latency (c=100) |
|----------------------|--------------:|---------------:|---------------:|----------------:|
| Node.js              |       83.59us |       253.57us |         1.03ms |          2.19ms |
| Spray                |      686.19us |         0.92ms |         2.71ms |          2.59ms |
| Erlang               |       40.60ms |        40.58ms |        40.35ms |         40.43ms |
| Http-kit             |       98.01us |       770.13us |       683.12us |          1.36ms |
| Warp                 |      116.25us |       333.56us |         1.30ms |          2.18ms |
| Tornado              |      414.73us |         2.28ms |        12.21ms |         24.95ms |
| Puma                 |       96.37us |       510.70us |         2.83ms |          5.88ms |
| Netty                |       53.17us |       113.52us |       635.84us |          1.18ms |
| Spark (Jetty)        |        2.04ms |       617.83us |         6.23ms |          7.94ms |
| Spring Boot (Tomcat) |        7.09ms |       815.26us |         2.25ms |          3.81ms |
| Reactor              |        2.19ms |         3.93ms |         6.72ms |          8.49ms |
| PHP-FPM              |      355.04us |         1.26ms |         6.37ms |         11.60ms |
| HHVM                 |      824.73us |         1.53ms |         5.62ms |         10.47ms |
| ReactPHP (PHP)       |      626.27us |         1.05ms |         3.81ms |         10.83ms |
| ReactPHP (HHVM)      |      481.31us |       811.58us |         3.21ms |         15.36ms |


## I don't believe you!

You can checkout the repo and do benchmarking yourself.

Starting Node.js app:

    $ cd node
    $ node main.js
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Spray (Scala) app:

    $ cd spray
    $ sbt stage
    $ target/universal/stage/bin/server
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Erlang app:

    $ cd erlang
    $ erlc erlanghttp.erl && erl -noshell -run erlanghttp start
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Http-kit app:

    $ cd httpkit
    $ lein run
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Warp (Haskell) app:

    $ cd warp
    $ cabal run -- +RTS -N
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

    # To compile, run:
    $ cd warp
    $ cabal install warped.cabal

Starting Puma + Rack (Ruby) app:

    $ cd puma-rack
    $ bundle install # Install gems
    # puma -C puma.rb
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Netty app:

    $ cd netty
    $ mvn install
    $ mvn compile
    $ mvn exec:java -Dexec.mainClass=NettyServer
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Spark app:

    $ cd spark
    $ mvn install
    $ mvn compile
    $ mvn exec:java -Dexec.mainClass=SparkMain
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Spring boot app:

    $ cd spring-boot
    $ mvn install
    $ mvn compile
    $ mvn exec:java -Dexec.mainClass=SpringBootMain

Starting Reactor app:

    $ cd reactor
    $ mvn install
    $ mvn compile
    $ mvn exec:java -Dexec.mainClass=ReactorExample

Starting PHP-FPM:

    $ cd php-fpm
    $ ./start.sh    # starts PHP-FPM and nginx

Starting HHVM:

    $ cd hhvm
    $ ./start.sh    # starts HHVM and nginx

Starting ReactPHP (PHP):

    $ cd reactphp
    $ ./start.sh    # starts ReactPHP using PHP and nginx

Starting ReactPHP (HHVM):

    $ cd reactphp
    $ ./start.sh    # starts ReactPHP using HHVM and nginx

## Kudos to

- [@olegsmetanin](https://github.com/olegsmetanin) for fixing Node.js to use clustering and Erlang benchmark
- [@ollie](https://github.com/ollie) for Warp and Puma
