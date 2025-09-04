require "kemal"
require "json"

# Отключаем логгер (важно: до определения роутов)
Kemal.config.logging = false

post "/json" do |env|
  body = env.request.body.not_nil!.gets_to_end
  data = JSON.parse(body)

  number  = data["number"].as_i

  { "number" => number + 1 }.to_json
end

Kemal.run