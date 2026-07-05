return {
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "catppuccin-frappe",
            -- colorscheme = "minispring",
            -- colorscheme = "unokai",
            colorscheme = "duskhaven",
        }
    },
    {
        "danhat1020/silence.nvim",
        config = function()
            require("silence").setup({
                -- options here (see configuration)
            })
            -- vim.cmd("colorscheme silence")
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        style = "night",
        opts = {
            on_colors = function(colors)
                colors.border = colors.blue
            end,
            -- on_highlights = function(hl)
            --     hl.comment = { bg = "#000000", fg = "#444444" }
            --     hl.perlComment = { bg = "#000000", fg = "#444444" }
            --     hl.Comment = { bg = "#000000", fg = "#444444" }
            --     --hl.IlluminatedWordText = { bg = "#ffffff", fg = "#ffffff" }
            -- end,
        },
    },
    {
        "kbraggins/duskhaven.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("duskhaven")
        end,
    }
}
