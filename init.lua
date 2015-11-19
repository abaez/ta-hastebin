--- the Textadept initializer for the hastebin client.
-- See @{README.md} for details on usage.
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2014
-- @license MIT (see LICENSE)
-- @module hastebin


local ul = require("hastebin.ul")

--- the default settings for this hastebin client.
-- @table config
-- @field DEFAULT_URL defines the default url to use
-- @field DEFAULT_KEYS a boolean for using default keys. Use false to disable.
local M = {
  DEFAULT_URL = _G.HB_DEFAULT_URL or "http://hastebin.com",
  DEFAULT_KEYS = _G.HB_DEFAULT_KEYS or true
}

--- the run for the hastebin script.
-- You can call this function using the metamethod __call.
-- Calls to @{ul.post} function.
function M:new()
  -- @param chunk used for the code that will be pasted.
  local chunk

  -- checks the type of chunk taken. If no selected text then stingify the file
  if #buffer:get_sel_text() == 0 then
    chunk = {}
    for line in io.open(buffer.filename):lines("*L") do
      chunk[#chunk + 1] = line
    end

    chunk = table.concat(chunk)
  else
    chunk = buffer:get_sel_text()
  end

  -- see @{ul|post} for information.
  local paste = ul.post(self.DEFAULT_URL, chunk)
  local final_url = self.DEFAULT_URL .. "/" .. paste["key"] ..
                    buffer.filename:match("[^(.+/)](%..+)")

  ui.statusbar_text = string.format(("%s added to the clipboard"), final_url)
  ui.clipboard_text = final_url
end

--- makes new() the default call for the module through metatables.
-- @function __call
setmetatable(M, {__call = function(self)
  return self:new()
end})

--- the configuration for the default keys.
-- see @{config|DEFAULT_KEYS} for more information.
if not CURSES and M.DEFAULT_KEYS then
    keys[not OSX and 'cac' or 'cmc'] = {M}
end

return M
