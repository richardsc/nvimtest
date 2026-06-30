return {
    "oribarilan/lensline.nvim",
    -- tag = "2.0.0", -- or: branch = 'release/2.x' for latest non-breaking updates
    branch = "release/2.x",
    event = "LspAttach",
    config = function()
        require("lensline").setup()
    end,
}
