
local http = require("socket.http")
local ltn12 = require("ltn12")


local function post(chunk, url)
  -- table which will hold the response of the server
  local response = {}
  assert(http.request{
    url = url .. "/documents",
    redirect = true,
    headers = {
      ["content-length"] = #chunk
    },
    method = "POST",
    source = ltn12.source.string(chunk),
    sink = ltn12.sink.table(response)
  })

  return response
end


return {
  post = post
}
