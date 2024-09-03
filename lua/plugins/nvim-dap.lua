local plugin = {
  lazy=false,
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python"
  },
  config = function()
    require("dapui").setup()
    require("dap-go").setup()
    require("dap-python").setup("/home/murakon/.virtualenvs/debugpy/bin/python")
    
    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Keybindings for DAP
    vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")

    -- Keybindings for dap-python
    vim.keymap.set("n", "<Leader>dn", ":lua require('dap-python').test_method()<CR>")
    vim.keymap.set("n", "<Leader>df", ":lua require('dap-python').test_class()<CR>")
    vim.keymap.set("v", "<Leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>")
  end,
}

return plugin
