local plugins= {

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },



  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

   {
   	"nvim-treesitter/nvim-treesitter",
   	oopts = {
 		ensure_installed = "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "ninja",
      "rst",
   	},
   },

  require "plugins.dashboard",
  require "plugins.none-ls"
}



return plugins
