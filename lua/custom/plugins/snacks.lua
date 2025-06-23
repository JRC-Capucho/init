return {
  'folke/snacks.nvim',
  opts = {
    gitbrowse = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      { desc = 'Delete Buffer' },
      {
        '<leader>bo',
        function()
          Snacks.bufdelete.other()
        end,
        { desc = 'Delete Other Buffers' },
      },
    },
  },
}
