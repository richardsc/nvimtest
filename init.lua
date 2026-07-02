-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Force comments and keywords to use Victor Mono's cursive italic style
vim.api.nvim_set_hl(0, "Comment", { italic = true })
vim.api.nvim_set_hl(0, "Keyword", { italic = true })
