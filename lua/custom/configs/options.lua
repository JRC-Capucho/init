vim.g.mapleader = ' '

vim.g.maplocalleader = ' '

vim.o.rnu = true

vim.o.nu = true

vim.o.mouse = 'a'

vim.g.have_nerd_font = true

vim.o.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true

vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.cursorlineopt = 'number'

vim.opt.scrolloff = 8

vim.o.wrap = false

vim.opt.hlsearch = false

vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.smartindent = true

vim.o.tabstop = 2

vim.o.softtabstop = 2

vim.o.shiftwidth = 2

vim.o.expandtab = true
