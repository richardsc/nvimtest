-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://www.lazyvim.org/configuration/tips#disable-autoformat-for-some-buffers
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "r", "rmd", "rnw" },
  callback = function()
    vim.b.autoformat = false
  end,
})
