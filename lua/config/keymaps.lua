local keymap = vim.keymap

local opts = { noremap = true, silent = true }
-- Directory navigation is currently housed with the nvim-tree.lua

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle minimise

-- File navigation

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Mason, Lazy, LSP, Conform checking
keymap.set("n", "<leader>ch", ":checkhealth mason<CR>", opts) -- checkhealth
keymap.set("n", "<leader>im", ":Mason<CR>", opts) -- open mason menu
keymap.set("n", "<leader>il", ":Lazy<CR>", opts) -- open lazy menu
keymap.set("n", "<leader>is", ":LspInfo<CR>", opts) -- open lsp info
keymap.set("n", "<leader>ic", ":ConformInfo<CR>", opts) -- open Config menu
