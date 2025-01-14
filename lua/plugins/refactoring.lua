return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },

  lazy = false,
  config = function()
    require('refactoring').setup {}

    vim.keymap.set('x', '<leader>re', ':refactor extract ')
    vim.keymap.set('x', '<leader>rf', ':refactor extract_to_file ')
    vim.keymap.set('x', '<leader>rv', ':refactor extract_var ')
    vim.keymap.set({ 'n', 'x' }, '<leader>ri', ':refactor inline_var')
    vim.keymap.set('n', '<leader>ri', ':refactor inline_func')
    vim.keymap.set('n', '<leader>rb', ':refactor extract_block')
    vim.keymap.set('n', '<leader>rbf', ':refactor extract_block_to_file')
  end,
}
