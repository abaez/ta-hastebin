# ta-hastebin
## A simple [Hastebin](https://github.com/seejohnrun/haste-server) module for [Textadept](http://foicica.com/textadept/) by [Alejandro Baez](http://twitter.com/a_baez).

### DESCRIPTION
A quick little module that allows you to paste into a hastebin server. You
can very easily copy an entire file or selections of a chunk you want to share
by using the built in keyword shortcut. See the USAGE for more details.

### DEPENDENCIES
Requires [luasocket](http://w3.impa.br/~diego/software/luasocket/) and
[luajson](http://luaforge.net/projects/luajson/) to run properly. If you have
LuaDist installed, then the dependencies can be installed by running the
following: **lua ./dependencies.lua**.

### INSTALL
You can install by cloning the repository into your module path of textadept
and renaming it to `hastebin`. This can easily be done like so:

```
cd <Textadept install path>/modules
hg clone https://bitbucket.org/a_baez/ta-hastebin hastebin
```
Afterwards, append into your textadept's **init.lua** file the following:

```
require "hastebin"
```
Lastly go to the **config.lua** file supplied with the module and change the
default url to the hastebin server of your choosing.

If you want to use your own keymapping, then call the module by typing
`local hb = require("hastebin")` and define your keymap by typing something
like this: `keys[cac] = {hb}`. If you want to change the the default keymapping,
add `HB_DEFAULT_KEYS = false`, to your **_USERHOME/init.lua**
file. This will disable the default keys.

### USAGE
You can use the hastebin client by highlighting any chunk of code and running
the default keymapped command `ctrl+alt+c` for Linux and Windows, or the Mac OS
command `⌘+^+c`. If you don't highlight any code and press the keyboard
shortcut, then the module will take the entire file to paste into hastebin. You
should now have the url copied to your clipboard to use, at your discretion.
