# Node.js vs. Spray

Comparison of [Node.js](http://nodejs.org) and [Spray](http://spray.io/) performance.

See `node-results.txt` and `spray-results.txt` for `wrk` benchmark results.

You can checkout the repo and do benchmarking yourself. 

Benchmarking Node.js app:

    $ cd node
    $ node main.js &
    $ ../do-benchmark.sh http://127.0.0.1:8080/

Starting Spray (Scala) app:

    $ cd spray
    $ sbt run &
    $ ../do-benchmark.sh http://127.0.0.1:8080/
