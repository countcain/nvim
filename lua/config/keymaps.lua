-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")
vim.keymap.set({ "i", "x", "n", "s" }, "<S-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
