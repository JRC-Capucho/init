-- return {
--   'scottmckendry/cyberdream.nvim',
--   lazy = false,
--   priority = 1000,
--   init = function()
--     vim.cmd [[colorscheme cyberdream]]
--   end,
-- }

-- return {
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   init = function()
--     vim.cmd [[colorscheme nekonight]]
--   end,
-- }

-- return {
--   'olivercederborg/poimandres.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--
--   init = function()
--     vim.cmd 'colorscheme poimandres'
--   end,
-- }

-- return {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   config = function()
--     vim.cmd 'colorscheme rose-pine'
--   end,
-- }
--
--

-- return {
--   'sainnhe/sonokai',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.sonokai_enable_italic = true
--     vim.g.sonokai_style = 'andromeda'
--
--     vim.cmd.colorscheme 'sonokai'
--   end,
-- }

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
