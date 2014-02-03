# textadept-hastebin
## A simple Hastebin Client for Textadept by [@a_baez](http://twitter.com/a_baez)

### DESCRIPTION
A quick little module that allows you to paste into a hastebin server. You
can very easily copy an entire file or selections of a chunk you want to share
by using the built in keyword shortcut. See the USAGE for more details.

### DEPENDENCIES
Requires [luasocket](http://w3.impa.br/~diego/software/luasocket/) and
[luajson](http://luaforge.net/projects/luajson/) to run properly. If you have
LuaDist installed, then the dependencies can be installed by running the
following: `lua ./dependencies.lua` file inside the repository directory.

### INSTALL
You can install by cloning the repository into your module path of textadept
and renaming it to `hastebin`. This can easily be done like so:

    cd <Textadept install path>/modules
    hg clone https://ab@learning.undonestar.tk/textadept-hastebin hastebin

Afterwards, if you want to use the default binding, append into your `init.lua`
of textadept the following:
    require "hastebin"

If you want to use your own keymapping, then call the module by typing
`local hb = require("hastebin")` and define your keymap by typing something
like this: `keys[cac] = {hb}`.

### USAGE
You can use the hastebin client by highlighting any chunk of code and running
the default keymapped command `ctrl+alt+c` for Linux and Windows, or the Mac OS
command `⌘+^+c`. If you don't highlight any code and press the keyboard
shortcut, then the module will take the entire file to paste into hastebin. You
should now have the url copied to your clipboard to use, at your discretion.
