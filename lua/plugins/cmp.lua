return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  version = '1.*',
  event = 'VimEnter',
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
      default = { 'lsp', 'path', 'snippets', 'buffer', 'dadbod', 'lazydev' },
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
      },
    },

    fuzzy = { implementation = 'lua' },

    signature = { enabled = true },
  },
}
