vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  keys = {
    {
      '\\',
      '<cmd>NvimTreeToggle<cr>',
    },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    view = {
      side = 'right',
      width = 38,
    },
    renderer = {
      root_folder_label = false, -- hide root directory at the top
      indent_markers = {
        enable = enable, -- folder level guide
        icons = {
          corner = '└',
          edge = '│',
          item = '│',
          bottom = '─',
          none = ' ',
        },
      },
      icons = {
        glyphs = {
          folder = {
            default = '',
            open = '',
            empty = '',
            empty_open = '',
          },
          git = {
            unstaged = '',
            staged = '',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌',
          },
        },
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = false,
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    filters = {
      enable = true,
      dotfiles = false,
      git_clean = false,
      git_ignored = false,
      no_bookmark = false,
      no_buffer = false,
      custom = { 'node_modules', 'vendor', '\\.cache' },
      exclude = {},
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
  },
}
