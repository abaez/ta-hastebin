

local http = require("socket.http")
local ltn12 = require("ltn12")

f = io.open("star_jack.sh", "r")

  local t = {}
  for line in f:lines("*L") do
    t[#t + 1] = line
  end
f = table.concat(t)
--print(f:seek("end"))


local function post(file, url)
  -- table which will hold the response of the server
  local response = {}
  assert(http.request{
    url = url or haste_default,
    redirect = true,
    headers = {
      ["content-length"] = #file
    },
    method = "POST",
    source = ltn12.source.string(file),
    sink = ltn12.sink.table(response)
  })

  return response
end


return {
  post = post
}
