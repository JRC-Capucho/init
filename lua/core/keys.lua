vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('n', 'J', 'mzJ`z', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)
vim.keymap.set('i', '<C-c>', '<Esc>', opts)
vim.keymap.set('i', '<C-[>', '<Esc>', opts)
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz', opts)
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz', opts)
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opts)

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], opts)
vim.keymap.set('x', '<leader>p', [["_dP]], opts)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], opts)
vim.keymap.set('n', '<leader>Y', [["+Y]], opts)

vim.keymap.set('n', '<Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', opts)

vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end)

vim.keymap.set('n', '<leader>t', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 5)
end)
