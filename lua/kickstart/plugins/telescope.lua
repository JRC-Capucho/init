return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

    vim.keymap.set('n', '<C-p>', builtin.git_files, {})

    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand '<cword>'
      builtin.grep_string { search = word }
    end)

    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand '<cWORD>'
      builtin.grep_string { search = word }
    end)

    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string { search = vim.fn.input 'Grep > ' }
    end)

    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    vim.keymap.set('n', '<leader>pc', function()
      require('telescope').extensions.flutter.commands()
    end)

    vim.keymap.set('n', '<leader>pt', builtin.treesitter, {})

    vim.keymap.set('n', '<leader>pn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, {})
  end,
}
