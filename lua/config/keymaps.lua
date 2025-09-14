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

-- Toggle between visual (wrapped line) and logical line navigation
local visual_mode = false
function ToggleLineMode()
    if visual_mode then
        -- Restore logical navigation
        vim.keymap.set({ "n", "v", "o" }, "j", "j", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v", "o" }, "k", "k", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v", "o" }, "0", "0", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v", "o" }, "$", "$", { noremap = true, silent = true })
        print("Logical line navigation")
    else
        -- Enable visual (screen line) navigation
        vim.keymap.set({ "n", "v", "o" }, "j", "gj", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v", "o" }, "k", "gk", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v", "o" }, "0", "g0", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v", "o" }, "$", "g$", { noremap = true, silent = true })
        print("Visual line navigation")
    end
    visual_mode = not visual_mode
end

-- Bind to <leader>tl (toggle lines)
vim.keymap.set("n", "<leader>tl", ToggleLineMode, {
    noremap = true,
    silent = true,
    desc = "Toggle logical/visual line navigation"
})
