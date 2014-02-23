# Node.js vs. Spray vs. Erlang vs. Http-kit vs. Warp

Comparison of raw HTTP hit performance of:

- [Node.js](http://nodejs.org)
- [Spray (Scala)](http://spray.io)
- [Erlang HTTP server](http://erlang.org/doc/apps/inets/http_server.html)
- [Http-kit (Clojure)](http://http-kit.org/index.html)
- [Warp (Haskell)](http://hackage.haskell.org/package/warp)

## Results

See `*-results.txt` for `wrk` benchmark results.

| Environment | Concurrency | Req/s    |
|-------------|------------:|---------:|
| Node.js     |           1 |  8590.95 |
|             |          10 | 19619.37 |
|             |          50 | 19217.57 |
|             |         100 | 19606.67 |
| Spray       |           1 |  7595.75 |
|             |          10 | 18592.71 |
|             |          50 | 29571.34 |
|             |         100 | 31541.73 |
| Erlang      |           1 |  6750.29 |
|             |          10 | 15574.33 |
|             |          50 | 13455.14 |
|             |         100 | 13931.52 |
| Http-kit    |           1 | 10145.90 |
|             |          10 | 34416.03 |
|             |          50 | 36520.01 |
|             |         100 | 34391.64 |
| Warp        |           1 | 12640.29 |
|             |          10 | 27749.54 |
|             |          50 | 26365.52 |
|             |         100 | 23916.69 |


## I don't believe you!

You can checkout the repo and do benchmarking yourself.

Starting Node.js app:

    $ cd node
    $ node main.js
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Spray (Scala) app:

    $ cd spray
    $ sbt run
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Erlang app:

    $ cd erlang
    $ erl
    $ c(erlanghttp).
    $ erlanghttp:start().
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Http-kit app:

    $ cd httpkit
    $ lein run
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Warp (Haskell) app:

    $ cd warp
    $ ./warped
    Open new terminal window.
    $ ../do-benchmark.sh http://127.0.0.1:8080/

    # To compile, run:
    $ cd warp
    $ ghc -O3 warped.hs

## Kudos to

- [@olegsmith](https://github.com/olegsmith) for fixing Node.js to use clustering and Erlang benchmark
- [@ollie](https://github.com/ollie) for Warp code
