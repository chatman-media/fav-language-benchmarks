
> ~ ◦ wrk -t12 -c400 -d30s -s post_json.lua http://localhost:3000/json
Running 30s test @ http://localhost:3000/json
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.28ms    2.70ms  55.88ms   90.38%
    Req/Sec    12.58k     2.21k   34.98k    72.41%
  4512797 requests in 30.10s, 598.22MB read
Requests/sec: 149910.42
Transfer/sec:     19.87MB