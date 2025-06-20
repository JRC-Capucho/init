return {
  'folke/snacks.nvim',
  opts = {
    explorer = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
    {
      '<leader>E',
      function()
        Snacks.explorer { cwd = vim.fn.expand '%:p:h' }
      end,
    },
    {
      '<leader>t',
      function()
        Snacks.terminal()
      end,
    },
  },
}
