local group = vim.api.nvim_create_augroup('user_cmds', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = group,
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = group,
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('LspProgress', {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    vim.notify(vim.lsp.status(), 'info', {
      id = 'lsp_progress',
      title = 'LSP Progress',
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == 'end' and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYNVIMRC', {})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'man' },
  group = group,
  command = 'nnoremap <buffer> q <cmd>quit<cr>',
})

-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = 'copilot-*',
--   callback = function()
--     vim.opt_local.relativenumber = false
--     vim.opt_local.number = false
--     vim.opt_local.conceallevel = 0
--   end,
-- })
--
--
