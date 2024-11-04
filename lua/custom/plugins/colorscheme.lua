return {
  'diegoulloao/neofusion.nvim',
  priority = 1000,
  config = true,
  init = function()
    vim.o.background = 'dark'
    require('neofusion').setup {
      transparent_mode = true,
    }
    vim.cmd.colorscheme 'neofusion'
  end,
}
