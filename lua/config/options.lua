-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_ruff = "ruff_lsp"
vim.g.lazyvim_python_ruff = "ruff"
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.g.maplocalleader = ","
vim.opt.wrap = true
vim.o.autochdir = true
vim.o.cursorlineopt = "number,screenline"
vim.o.cursorcolumn = true
