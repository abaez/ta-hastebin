--- a quick POST script using luasockets and luajson.
-- @author Alejandro Baez <alejan.baez@gmail.com>
-- @copyright 2014
-- @license MIT see @{LICENSE}
-- @module ul


local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require("json") -- luajson

--- a POST interpretation tuned for use with the hastebin plugin.
-- @function post
-- @param url see @{hastebin|DEFAULT_URL} for more information.
-- @param chunk a code string to be processed by the http request.
local function post(url, chunk)
  --- a local table which holds the response of the http request.
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

  return json.decode(response[1])
end

--- @export
return {
  post = post
}
