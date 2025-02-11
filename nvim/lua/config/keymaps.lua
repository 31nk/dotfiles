-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Enable system clipboard
vim.opt.clipboard = "unnamedplus"

-- Keybindings for Copy, Paste, and Select All
vim.keymap.set("v", "<C-S-c>", '"+y', { noremap = true, silent = true }) -- Copy
vim.keymap.set("i", "<C-S-v>", "<C-r>+", { noremap = true, silent = true }) -- Paste in insert mode
vim.keymap.set("n", "<C-S-v>", '"+p', { noremap = true, silent = true }) -- Paste in normal mode
vim.keymap.set("v", "<C-S-v>", '"+p', { noremap = true, silent = true }) -- Paste in visual mode
vim.keymap.set("n", "<C-S-a>", "ggVG", { noremap = true, silent = true }) -- Select All

vim.api.nvim_set_keymap('n', '<C-a>', '<C-u>', { noremap = true, silent = true })

