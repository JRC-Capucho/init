local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load 'core.opts'
load 'core.keys'
load 'core.cmds'
load 'core.lazy'
pcall(vim.cmd.colorscheme, 'tokyonight-night')
load 'core.transparent'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
