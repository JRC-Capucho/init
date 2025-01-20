-- return {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   config = function()
--     vim.cmd 'colorscheme rose-pine'
--   end,
-- }
--
--

return {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_style = 'andromeda'

    vim.cmd.colorscheme 'sonokai'
  end,
}
