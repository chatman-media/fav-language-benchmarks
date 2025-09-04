# Fav Language Benchmarks

# Crystal

```wrk -t12 -c400 -d30s -s post_json.lua http://localhost:3000/json
Running 30s test @ http://localhost:3000/json
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     4.78ms    0.97ms  34.05ms   79.88%
    Req/Sec     6.95k     1.45k   92.98k    98.83%
  2492027 requests in 30.10s, 377.88MB read
Requests/sec:  82782.54
Transfer/sec:     12.55MB
```

# Go

```wrk -t12 -c400 -d30s -s post_json.lua http://localhost:3000/json
Running 30s test @ http://localhost:3000/json
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     5.06ms    1.57ms  54.37ms   87.95%
    Req/Sec     6.50k   356.56    13.03k    89.61%
  2333525 requests in 30.08s, 311.56MB read
Requests/sec:  77586.84
Transfer/sec:     10.36MB
```

# Rust

```wrk -t12 -c400 -d30s -s post_json.lua http://localhost:3000/json
Running 30s test @ http://localhost:3000/json
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.28ms    2.70ms  55.88ms   90.38%
    Req/Sec    12.58k     2.21k   34.98k    72.41%
  4512797 requests in 30.10s, 598.22MB read
Requests/sec: 149910.42
Transfer/sec:     19.87MB
```

# Deno

```wrk -t12 -c400 -d30s -s post_json.lua http://localhost:3000/json
Running 30s test @ http://localhost:3000/json
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     7.05ms    1.29ms 121.09ms   86.90%
    Req/Sec     4.69k   193.69     5.24k    83.92%
  1681923 requests in 30.04s, 259.85MB read
Requests/sec:  55996.07
Transfer/sec:      8.65MB
```

# Bun

```wrk -t12 -c400 -d30s -s post_json.lua http://localhost:3000/json
Running 30s test @ http://localhost:3000/json
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     5.71ms  491.83us  31.07ms   98.16%
    Req/Sec     5.81k   703.22    36.25k    99.61%
  2082350 requests in 30.10s, 276.04MB read
Requests/sec:  69177.80
Transfer/sec:      9.17MB
```

# Nim

```wrk -t12 -c400 -d30s -s post_json.lua http://localhost:3000/json
Running 30s test @ http://localhost:3000/json
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    44.80ms   96.42ms   2.00s    98.57%
    Req/Sec     0.91k   133.67     3.20k    92.26%
  327033 requests in 30.09s, 31.81MB read
  Socket errors: connect 0, read 0, write 0, timeout 102
Requests/sec:  10869.06
Transfer/sec:      1.06MB
```