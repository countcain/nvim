-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")
vim.keymap.set({ "x", "n", "s" }, "<S-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

vim.keymap.del({ "n", "v" }, "<leader>cf")
vim.keymap.set({ "n", "v" }, "<C-f>", function()
  Util.format({ force = true })
end, { desc = "Format" })

vim.keymap.set("i", "<C-l>", "<Right>", { desc = "<C-l> to move right in insert mode" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "<C-h> to move left in insert mode" })
