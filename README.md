# Node.js vs. Spray vs. Erlang vs. Http-kit

Comparison of raw HTTP hit performance of:

- [Node.js](http://nodejs.org)
- [Spray (Scala)](http://spray.io)
- [Erlang HTTP server](http://erlang.org/doc/apps/inets/http_server.html)
- [Http-kit (Clojure)](http://http-kit.org/index.html)

See `*-results.txt` for `wrk` benchmark results.

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
