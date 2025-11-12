-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://www.lazyvim.org/configuration/tips#disable-autoformat-for-some-buffers
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "r", "rmd", "rnw", "quarto", "markdown" },
    callback = function()
        vim.b.autoformat = false
    end,
})

-- Make CR send one line to the Julia console
vim.api.nvim_create_autocmd("FileType", {
    pattern = "julia",
    callback = function()
        local iron = require("iron.core")
        -- Start the Julia REPL with <leader>jr
        vim.keymap.set("n", "<leader>jr", "<cmd>IronRepl<CR>", {
            buffer = true,
            desc = "Start Julia REPL",
        })
        -- Send current line to Julia REPL, then move down one line
        vim.keymap.set("n", "<CR>", function()
            iron.send_line()
            vim.cmd("normal! j")
            desc = "Send current line to Julia REPL"
        end, {
            buffer = true,
            desc = "Send line to Julia REPL and move down",
        })
        -- Visual mode: send selected lines and stay on next line after selection
        vim.keymap.set("v", "<CR>", function()
            iron.visual_send()
            -- move cursor to the line after the visual selection
            vim.cmd("normal! gv")  -- reselect the last visual selection
            vim.cmd("normal! `>j") -- jump to end and go down one line
        end, {
            buffer = true,
            desc = "Send visual selection to Julia REPL and move down",
        })
    end,
})
