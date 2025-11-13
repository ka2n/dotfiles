return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        cmd = 'Telescope',
        opts = {
            extensions = {
                frecency = {
                    auto_validate = true,
                },
            }
        }
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
    },
}
