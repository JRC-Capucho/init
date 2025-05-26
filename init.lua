local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load 'core.opts'
load 'core.keys'
load 'core.cmds'
require 'config.lazy'

pcall(vim.cmd.colorscheme, 'solarized-osaka')
load 'core.transparency'
