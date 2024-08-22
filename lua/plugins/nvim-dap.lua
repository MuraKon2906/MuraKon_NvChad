local plugins = {

  -- DAP UI for debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Key mappings for DAP UI
      vim.api.nvim_set_keymap('n', '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
    end,
  },

  -- Core DAP plugin
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- Key mappings for DAP controls
      vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>lua require("dap").step_into()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua require("dap").step_over()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dO', '<cmd>lua require("dap").step_out()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require("dap").repl.toggle()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require("dap").run_last()<CR>', { noremap = true, silent = true })
    end,
  },

  -- Python-specific debugging with DAP
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)

      -- Key mapping specific to Python DAP
      vim.api.nvim_set_keymap('n', '<leader>dpr', '<cmd>lua require("dap-python").test_method()<CR>', { noremap = true, silent = true })
    end,
  },

}

return plugins

