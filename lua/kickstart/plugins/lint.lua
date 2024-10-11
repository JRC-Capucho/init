return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
      'gbprod/none-ls-php.nvim',
    },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        debug = true,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.completion.spell,
          require 'none-ls.diagnostics.eslint',
          require 'none-ls-php.diagnostics.php',
        },
      }
    end,
  },

  -- { -- Linting
  --   'mfussenegger/nvim-lint',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   config = function()
  --     local lint = require 'lint'
  --     lint.linters_by_ft = {
  --       markdown = { 'markdownlint' },
  --       dockerfile = { 'hadolint' },
  --       php = { 'phpcs' },
  --     }
  --
  --     -- To allow other plugins to add linters to require('lint').linters_by_ft,
  --     -- instead set linters_by_ft like this:
  --     -- lint.linters_by_ft = lint.linters_by_ft or {}
  --     -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
  --     --
  --     -- However, note that this will enable a set of default linters,
  --     -- which will cause errors unless these tools are available:
  --     -- {
  --     --   clojure = { "clj-kondo" },
  --     --   dockerfile = { "hadolint" },
  --     --   inko = { "inko" },
  --     --   janet = { "janet" },
  --     --   json = { "jsonlint" },
  --     --   markdown = { "vale" },
  --     --   rst = { "vale" },
  --     --   ruby = { "ruby" },
  --     --   terraform = { "tflint" },
  --     --   text = { "vale" }
  --     -- }
  --     --
  --     -- You can disable the default linters by setting their filetypes to nil:
  --     -- lint.linters_by_ft['clojure'] = nil
  --     -- lint.linters_by_ft['dockerfile'] = nil
  --     -- lint.linters_by_ft['inko'] = nil
  --     -- lint.linters_by_ft['janet'] = nil
  --     -- lint.linters_by_ft['json'] = nil
  --     -- lint.linters_by_ft['markdown'] = nil
  --     -- lint.linters_by_ft['rst'] = nil
  --     -- lint.linters_by_ft['ruby'] = nil
  --     -- lint.linters_by_ft['terraform'] = nil
  --     -- lint.linters_by_ft['text'] = nil
  --
  --     -- Create autocommand which carries out the actual linting
  --     -- on the specified events.
  --     local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  --     vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  --       group = lint_augroup,
  --       callback = function()
  --         lint.try_lint()
  --       end,
  --     })
  --   end,
  -- },
}
