
local plugins = {
  -- Add toggleterm.nvim plugin
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
      require('toggleterm').setup{
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-q>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 3,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'float', -- 'horizontal' | 'vertical' | 'tab' | 'float'
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = 'double', -- 'single' | 'double' | 'shadow' | 'curved'
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      }

      -- Function to open terminal in the current directory with custom styling
      function _G.open_fancy_terminal_in_current_directory()
        local cwd = vim.fn.getcwd()
        local Terminal = require('toggleterm.terminal').Terminal
        local fancy_terminal = Terminal:new({
          dir = cwd,
          direction = "float",  -- You can change this to 'horizontal' or 'vertical'
          float_opts = {
            border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
            winblend = 3,
          },
        })
        fancy_terminal:toggle()
      end

      -- Keymap to open the fancy terminal in the current directory
      vim.api.nvim_set_keymap('n', '<leader>ft', ':lua open_fancy_terminal_in_current_directory()<CR>', {noremap = true, silent = true})
    end,
  },

  -- Add any other custom plugins here
}

return plugins

