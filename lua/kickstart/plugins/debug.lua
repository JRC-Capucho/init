-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  keys = function(_, keys)
    local dap = require 'dap'
    local dapui = require 'dapui'
    return {
      -- Basic debugging keymaps, feel free to change to your liking!
      { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
      { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
      { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
      { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      {
        '<leader>B',
        function()
          dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
      unpack(keys),
    }
  end,
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'delve',
      },
    }

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        detached = vim.fn.has 'win32' == 0,
      },
    }

    -- PHP
    local path = require('mason-registry').get_package('php-debug-adapter'):get_install_path()
    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = { path .. '/extension/out/phpDebug.js' },
    }
  end,
}
