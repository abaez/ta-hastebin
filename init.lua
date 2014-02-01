local M = {}
--setmetatable(M, meta)
local meta = {}

local ul = require("ul")

DEFAULT_URL = "http://localhost:7777"


local chunk

function meta.__call()

  if #buffer:get_sel_text() == 0 then
    chunk = {}
    for line in io.open(buffer.filename):lines("*L") do
      chunk[#chunk + 1] = line
    end

    chunk = table.concat(chunk)
  else
    chunk = buffer:get_sel_text()
  end

  paste = ul.post(DEFAULT_URL, chunk)

  final_url = DEFAULT_URL .. "/" .. paste["key"]
  ui.statusbar_text(string.format("%s added to the clipboard"), final_url)
  ui.clipboard_text = final_url
end

setmetatable(M, meta)
return M
