--- the Textadept initializer for the hastebin client.
-- See @{README.md} for details on usage.
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2014
-- @license MIT (see LICENSE)
-- @module config

--- the default settings for this hastebin client.
-- @table config
-- @field DEFAULT_URL defines the default url to use
-- @field DEFAULT_KEYS a boolean for using default keys. Use false to disable.
return {
  DEFAULT_URL = _G.DEFAULT_URL or "http://hastebin.com",
  DEFAULT_KEYS = _G.DEFAULT_KEYS or true
}
