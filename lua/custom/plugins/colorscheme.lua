return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      transparent_background = true,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}

-- {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   config = function()
--     require('rose-pine').setup {
--       styles = {
--         transparency = true,
--       },
--     }
--     vim.cmd.colorscheme 'rose-pine-moon'
--     -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--     -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
--     -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
--   end,
-- }
