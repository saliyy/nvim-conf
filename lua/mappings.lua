require "nvchad.mappings"

-- add yours here
require('telescope').setup{}

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })
map('n', '<F5>', ":lua require'dap'.continue()<CR>", { noremap = true })
map('n', '<F10>', ":lua require'dap'.step_over()<CR>", { noremap = true })
map('n', '<F11>', ":lua require'dap'.step_into()<CR>", { noremap = true })
map('n', '<F12>', ":lua require'dap'.step_out()<CR>", { noremap = true })
map('n', '<F9>', ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
