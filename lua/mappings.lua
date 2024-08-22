require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Terminal key mappings
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<leader>tt", "<C-\\><C-n><cmd>ToggleTerm<CR>", { desc = "Toggle terminal in terminal mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
