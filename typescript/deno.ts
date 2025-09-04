import { serve } from "https://deno.land/std@0.203.0/http/server.ts";

serve(async (req) => {
  if (req.method === "POST" && new URL(req.url).pathname === "/json") {
    const body = await req.json();
    return new Response(
      JSON.stringify({ message: "world", number: body.number + 1 }),
      { headers: { "Content-Type": "application/json" } }
    );
  }
  return new Response("Not found", { status: 404 });
}, { port: 3000 });