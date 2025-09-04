import asynchttpserver, asyncdispatch, json, strutils, uri

proc main() {.async.} =
  var server = newAsyncHttpServer()
  
  proc cb(req: Request) {.async.} =
    let url = parseUri(req.url.path)
    
    if req.reqMethod == HttpPost and url.path == "/json":
      try:
        let bodyStr = req.body
        let bodyJson = parseJson(bodyStr)
        let number = bodyJson["number"].getInt()
        
        let response = %*{
          "message": "world",
          "number": number + 1
        }
        
        await req.respond(Http200, $response, 
          newHttpHeaders([("Content-Type", "application/json")]))
      except:
        await req.respond(Http400, "Bad Request")
    else:
      await req.respond(Http404, "Not found")
  
  server.listen(Port(3000))
  echo "Server running on port 3000"
  
  while true:
    if server.shouldAcceptRequest():
      await server.acceptRequest(cb)
    else:
      await sleepAsync(10)

when isMainModule:
  waitFor main()