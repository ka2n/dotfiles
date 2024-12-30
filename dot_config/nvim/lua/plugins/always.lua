return {
    {
        'shaunsingh/nord.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme nord]]
            vim.g.nord_italic = false
            require('nord').set()
        end,
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    }
}
