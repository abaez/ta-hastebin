--- the Textadept initializer for hastebin_client.
-- See @{README} for details on usage.
-- @author Alejandro Baez <alejan.baez@gmail.com>
-- @copyright 2014
-- @license MIT see @{LICENSE}
-- @module hastebin_client



local M = {}
--setmetatable(M, meta)
local meta = {}
local ul = require("hastebin.ul")

DEFAULT_URL = "http://code.undonestar.tk:7777"
--DEFAULT_URL = "http://hastebin.com"

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

  paste = ul.post(chunk, DEFAULT_URL)

  final_url = DEFAULT_URL .. "/" .. paste["key"]
  ui.statusbar_text = string.format(("%s added to the clipboard"), final_url)
  ui.clipboard_text = final_url
end

if not CURSES then
  keys[not OSX and 'cac' or 'cmc'] = {meta.__call}
end


setmetatable(M, meta)
return M
