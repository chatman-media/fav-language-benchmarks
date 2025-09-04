# server.nim
import asyncdispatch, asynchttpserver, httpcore, json, strutils

proc handleRequest(req: Request) {.async.} =
  if req.requestMethod == HttpPost and req.path == "/json":
    try:
      let body = await req.body
      let data = parseJson(body)
      if data.hasKey("number") and data["number"].kind == JInt:
        let number = data["number"].getInt()
        let response = %* {"message": "world", "number": number + 1}
        await req.respond(Http200, response.pretty(), { "Content-Type": "application/json" })
      else:
        await req.respond(Http400, "Missing or invalid 'number' field")
    except:
      await req.respond(Http400, "Invalid JSON")
  else:
    await req.respond(Http404, "Not found")

proc main() {.async.} =
  let server = newAsyncHttpServer()
  echo "🚀 Server running on http://localhost:3000"
  await server.serve(Port(3000), handleRequest)

wait main()