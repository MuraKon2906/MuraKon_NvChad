local plugins = {

  -- Plugin for Python Linters and Formatters using none-ls.nvim
  {
    "nvimtools/none-ls.nvim",
    lazy=false,

    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Python Formatters
          null_ls.builtins.formatting.black,      -- Black for code formatting
          null_ls.builtins.formatting.isort,      -- isort for import sorting

          -- Python Linters
          null_ls.builtins.diagnostics.mypy,      -- Mypy for type checking
        },
      })


      -- Auto format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.py" }, -- Apply this only to Python files
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
}

return plugins

