-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'kristijanhusak/vim-dadbod-ui',
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
    dependencies = { 'tpope/vim-dadbod', cmd = 'DB' },
    keys = {
      { '<leader>D', '<cmd>DBUIToggle<CR>', desc = 'Toggle DBUI' },
    },
    init = function()
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_execute_on_save = false
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    event = { 'BufNewfile', 'BufReadPre' },
    opts = {},
  },

  { 'akinsho/git-conflict.nvim', version = '*', opts = {} },

  {
    'brenoprata10/nvim-highlight-colors',
    opts = {},
  },

  {
    'folke/zen-mode.nvim',
    dependencies = {
      { 'folke/twilight.nvim', opts = {} },
    },
    opts = {},
  },

  {
    'folke/trouble.nvim',
    opts = {},
  },

  {
    'NeogitOrg/neogit',
    dependencies = {
      'sindrets/diffview.nvim',
      'ibhagwan/fzf-lua',
    },
    keys = {
      {
        '<leader>gs',
        function()
          require('neogit').open()
        end,
      },
    },
    config = true,
  },

  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      'dart-lang/dart-vim-plugin',
    },
    opts = {
      widget_guides = {
        enabled = true,
      },
      outline = {
        open_cmd = '20vnew',
      },
      dev_log = {
        enabled = false,
      },
      debugger = {
        enabled = true,
        register_configurations = function(_)
          require('dap.ext.vscode').load_launchjs()
        end,
      },
    },
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'fredrikaverpil/neotest-golang',
      'nvim-neotest/neotest-jest',
      'nvim-neotest/neotest-python',
      'olimorris/neotest-rspec',
      'V13Axel/neotest-pest',
      'marilari88/neotest-vitest',
      'antoinemadec/FixCursorHold.nvim',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { justMyCode = false },
          },
          require 'neotest-vitest',
          require 'neotest-python',
          require 'neotest-pest',
          require 'neotest-golang',
          require 'neotest-jest',
          require 'neotest-rspec',
        },
      }
    end,
  },
}
