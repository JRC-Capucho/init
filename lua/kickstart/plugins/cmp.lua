local opt = vim.opt -- vim options

-- set options
opt.completeopt = 'menu,menuone,noselect'

-- vscode like icons
local cmp_kinds = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'petertriho/cmp-git',
      opts = {
        filetypes = {
          'gitcommit',
          'octo',
          'git_rebase',
          'NeogitCommitMessage',
        },
      },
    },
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
    'roobert/tailwindcss-colorizer-cmp.nvim',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'
    local tailwindcss_colorizer_cmp = require 'tailwindcss-colorizer-cmp'

    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = {
          scrollbar = false,
          border = 'rounded',
          completeopt = 'menu,menuone,noinsert',
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None',
          side_padding = 0,
          col_offset = -4,
        },
        documentation = {
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None',
        },
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item { behavior = 'insert' }
          else
            cmp.complete()
          end
        end),

        ['<C-n>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item { behavior = 'insert' }
          else
            cmp.complete()
          end
        end),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-y>'] = cmp.mapping.confirm { select = true },

        ['<C-s>;'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),

        ['<C-s>,'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },

      sources = {
        {
          name = 'lazydev',
          group_index = 0,
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'git' },
        { name = 'vim-dadbod-completion' },
      },

      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, item)
          -- vscode like icons for cmp autocompletion
          local fmt = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            before = tailwindcss_colorizer_cmp.formatter, -- prepend tailwindcss-colorizer
          }(entry, item)

          -- customize lspkind format
          local strings = vim.split(fmt.kind, '%s', { trimempty = true })

          -- strings[1] -> default icon
          -- strings[2] -> kind

          -- set different icon styles
          fmt.kind = ' ' .. (cmp_kinds[strings[2]] or '') -- concatenate icon based on kind

          -- append customized kind text
          fmt.kind = fmt.kind .. ' ' -- just an extra space at the end
          fmt.menu = strings[2] ~= nil and ('  ' .. (strings[2] or '')) or ''

          return fmt
        end,
      },
    }
  end,
}
