export default {
  port: 3000,
  fetch(req: Request): any {
    if (req.method === "POST" && new URL(req.url).pathname === "/json") {
      return req.json().then((body: any) => {
        return new Response(
          JSON.stringify({ message: "world", number: body.number + 1 }),
          { headers: { "Content-Type": "application/json" } }
        );
      });
    }
    return new Response("Not found", { status: 404 });
  },
};