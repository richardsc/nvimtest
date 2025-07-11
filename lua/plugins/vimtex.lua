return {
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- vim.g.vimtex_complete_enabled = 0 -- Disable auto-completion for references
            -- vim.g.vimtex_complete_bib = 0 -- Disable bibliography autocompletion
            -- vim.g.vimtex_echo_verbose_input = 0 -- Prevent verbose input echoes
            -- VimTeX configuration goes here, e.g.
            -- vim.g.vimtex_view_method = "zathura"
        end
    }
}
