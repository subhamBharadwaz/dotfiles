-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":windcmd k<CR>")
vim.keymap.set("n", "<c-j>", ":windcmd j<CR>")
vim.keymap.set("n", "<c-h>", ":windcmd h<CR>")
vim.keymap.set("n", "<c-l>", ":windcmd l<CR>")
