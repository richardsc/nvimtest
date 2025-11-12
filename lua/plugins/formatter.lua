-- This increases the formatting time limit to 60 seconds
-- see https://github.com/LazyVim/LazyVim/issues/51
-- Also, see issue 2 from Clark Richards, which suggested a new
-- way to write this to avoid warnings that started to appear
-- in July of 2024.
return {
    {
        "stevearc/conform.nvim",
        opts = function()
            local opts = {
                default_format_opts = {
                    timeout_ms = 60000,
                    async = false,           -- not recommended to change
                    quiet = false,           -- not recommended to change
                    lsp_format = "fallback", -- not recommended to change
                },
                formatters_by_ft = {
                    markdown = { "prettier" },
                },
            }
            return opts
        end,
    },
}
