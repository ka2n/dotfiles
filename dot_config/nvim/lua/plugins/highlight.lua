return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true,
                },
            }


            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade"
            }

            vim.treesitter.language.register("markdown", { "mdx" })
        end,
        event = 'VeryLazy',
    },
    {
        'GR3YH4TT3R93/nvim-highlight-colors', event = "VeryLazy", config = true,
    },
    { 'IndianBoy42/tree-sitter-just', config = true, event = 'VeryLazy', },
}
