return {
    -- R support (see https://github.com/R-nvim/R.nvim)
    {
        "R-nvim/R.nvim",
        lazy = false,
        config = function()
            -- Create a table with the options to be passed to setup()
            local opts = {
                hook = {
                    on_filetype = function()
                        vim.api.nvim_buf_set_keymap(0, "i", "_", "<Plug>RInsertAssign", { noremap = true })
                        vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
                        vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
                        if vim.bo.filetype == "rnoweb" then
                            vim.api.nvim_buf_set_keymap(0, "i", "<<", "<Plug>RnwInsertChunk", { noremap = true })
                        elseif vim.bo.filetype == "rmd" or vim.bo.filetype == "quarto" then
                            vim.api.nvim_buf_set_keymap(0, "i", "``", "<Plug>RmdInsertChunk", { noremap = true })
                        end
                    end,
                },
                pdfviewer = "",
                -- R_app = "radian",
                -- R_args = {},
                R_args = { "--quiet", "--no-save" },
                bracketed_paste = false,
                min_editor_width = 72,
                rconsole_width = 78,
                objbr_mappings = {                                  -- Object browser keymap
                    c = "class",                                    -- Call R functions
                    ["<localleader>gg"] = "head({object}, n = 15)", -- Use {object} notation to write arbitrary R code.
                    v = function()
                        -- Run lua functions
                        require("r.browser").toggle_view()
                    end,
                },
                disable_cmds = {
                    "RClearConsole",
                    "RCustomStart",
                    "RSPlot",
                    "RSaveClose",
                },
            }
            -- Check if the environment variable "R_AUTO_START" exists.
            -- If using fish shell, you could put in your config.fish:
            -- alias r "R_AUTO_START=true nvim"
            if vim.env.R_AUTO_START == "true" then
                opts.auto_start = "on startup"
                opts.objbr_auto_start = true
            end
            require("r").setup(opts)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                r_language_server = {
                    filetypes = { "r", "rnoweb", "rmd", "quarto" },
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern("DESCRIPTION", "NAMESPACE", ".Rbuildignore")(
                            fname
                        ) or require("lspconfig.util").find_git_ancestor(fname) or vim.loop.os_homedir()
                    end,
                },
            },
        },
    },
}
