return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = 'rafamadriz/friendly-snippets',

  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      cmdline = {
        preset = 'default',
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'vim-dadbod-completion', 'lazydev' },
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
