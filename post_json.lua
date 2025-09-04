-- post_json.lua
wrk.method = "POST"
wrk.body   = '{"number": 42}'
wrk.headers["Content-Type"] = "application/json"