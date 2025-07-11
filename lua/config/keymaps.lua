-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("i", "kk", "<ESC>", { silent = true })
vim.keymap.set("n", "<leader>gg", function()
    require("lazygit-confirm").confirm()
end, { noremap = true })
vim.keymap.set("t", "jj", [[<C-\><C-n>]])
vim.keymap.set("t", "kk", [[<C-\><C-n>]])
