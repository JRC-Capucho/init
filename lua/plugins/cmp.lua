return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = {
    'Kaiser-Yang/blink-cmp-git',
    'rafamadriz/friendly-snippets',
    'fang2hou/blink-copilot',
    {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      build = ':Copilot auth',
      event = 'InsertEnter',
      opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
        },
      },
    },
  },
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
      kind_icons = {
        Copilot = ' ',
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'dadbod', 'lazydev', 'copilot' },
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
          opts = {
            max_completions = 3,
            max_attempts = 4,
          },
        },
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },
    signature = { enabled = true },
  },
}
