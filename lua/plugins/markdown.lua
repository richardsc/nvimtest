return {
    {
        'Kicamon/markdown-table-mode.nvim',
        config = function()
            require('markdown-table-mode').setup()
        end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        config = function()
            require('render-markdown').setup({
                heading = {
                    enabled = true,
                    sign = true,
                    position = 'overlay',
                    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
                    signs = { '󰫎 ' },
                    width = 'full',
                    left_margin = 0,
                    left_pad = 0,
                    right_pad = 0,
                    min_width = 0,
                    border = false,
                    border_virtual = false,
                    border_prefix = false,
                    above = '▄',
                    below = '▀',
                    backgrounds = {
                        'RenderMarkdownH1Bg',
                        'RenderMarkdownH2Bg',
                        'RenderMarkdownH3Bg',
                        'RenderMarkdownH4Bg',
                        'RenderMarkdownH5Bg',
                        'RenderMarkdownH6Bg',
                    },
                    foregrounds = {
                        'RenderMarkdownH1',
                        'RenderMarkdownH2',
                        'RenderMarkdownH3',
                        'RenderMarkdownH4',
                        'RenderMarkdownH5',
                        'RenderMarkdownH6',
                    },
                },
            })
        end,
    }
}
