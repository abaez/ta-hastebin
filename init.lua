local M = {}

local ul = require("ul")

--DEFAULT_URL = "https://code.undonestar.tk"
DEFAULT_URL = "http://localhost:7777"

function M:init(url)
  self.url = (url or DEFAULT_URL) .. "/documents"
end

function M:ul_path(path)

end

function ul_raw(data)

end
