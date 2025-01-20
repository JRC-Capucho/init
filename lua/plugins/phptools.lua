return {
  'ccaglak/phptools.nvim',
  ft = 'php',
  keys = {
    { '<leader>lm', '<cmd>PhpTools Method<cr>' },
    { '<leader>lc', '<cmd>PhpTools Class<cr>' },
    { '<leader>ls', '<cmd>PhpTools Scripts<cr>' },
    { '<leader>ln', '<cmd>PhpTools Namespace<cr>' },
    { '<leader>lg', '<cmd>PhpTools GetSet<cr>' },
    { '<leader>lf', '<cmd>PhpTools Create<cr>' },
    { '<leader>ld', '<cmd>PhpTools DrupalAutoLoader<cr>' },
    { mode = 'v', '<leader>lr', '<cmd>PhpTools Refactor<cr>' },
  },
  dependencies = {
    'ccaglak/namespace.nvim', -- optional - php namespace resolver
    'ccaglak/larago.nvim', -- optional -- laravel goto blade/components
    'ccaglak/snippets.nvim', -- optional -- native snippet expander
  },
  config = function()
    require('phptools').setup {
      ui = {
        enable = false, -- default:true; false only if you have a UI enhancement plugin
        fzf = false, -- default:false; tests requires fzf used only in tests module otherwise there might long list  of tests
      },
      drupal_autoloader = { -- delete if you dont use it
        enable = false, -- default:false
        scan_paths = { '/web/modules/contrib/' }, -- Paths to scan for modules
        root_markers = { '.git' }, -- Project root markers
        autoload_file = '/vendor/composer/autoload_psr4.php', -- Autoload file path
      },
      custom_toggles = { -- delete if you dont use it
        enable = false, -- default:false
        -- { "foo", "bar", "baz" }, -- Add more custom toggle groups here
      },
    }

    local map = vim.keymap.set

    local ide_helper = require 'phptools.ide_helper' -- delete if you dont use it
    -- Laravel IDE Helper keymaps
    map('n', '<leader>lha', ide_helper.generate_all, { desc = 'Generate all IDE helpers' })
    map('n', '<leader>lhm', ide_helper.generate_models, { desc = 'Generate model helpers' })
    map('n', '<leader>lhf', ide_helper.generate_facades, { desc = 'Generate facade helpers' })
    map('n', '<leader>lht', ide_helper.generate_meta, { desc = 'Generate meta helper' })
    map('n', '<leader>lhi', ide_helper.install, { desc = 'Install IDE Helper package' })
  end,
}
