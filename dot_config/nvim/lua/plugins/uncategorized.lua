return {
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {
            markdown = {
                bullets = {},
                coldeblock_highlight = 'CodeBlock',
                dash_highlight = 'Dash',
                quote_highlight = 'Quote',
            },
        },
        event = "VeryLazy",
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = 'Neotree',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        },
        opts = {
            filesystem = {
                filtered_items = {
                    always_show = {
                        ".github",
                    },
                },
            },
        },

    },
    {
        'folke/lsp-colors.nvim',
        lazy = false,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        cmd = 'Telescope',
        opts = {
            extensions = {
                frecency = {
                    auto_validate = true,
                },
                coc = {}
            }
        }
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
    },
    {
        "fannheyward/telescope-coc.nvim",
    },
    {
        'zbirenbaum/copilot.lua',
        opts = {
            copilot_node_command = os.getenv('HOME') .. '/.local/share/mise/installs/node/20.8.1/bin/node',
            --
            panel = {
                enabled = false
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<C-l>",
                    dismiss = "<C-o>",
                    next = "<C-j>",
                    prev = "<C-k>",
                }
            }
        },
    },
    {
        'yetone/avante.nvim',
        event = 'VeryLazy',
        version = false,
        build = 'make BUILD_FROM_SOURCE=true',
        opts = {
            provider = 'claude',
            auto_suggestions_provider = 'copilot',
            claude = {
            },
            behaviour = {
                -- zbirenbaum/copilot.lua の方が反応が早いのでこっちは使わない
                auto_suggestions = false
            },
            mappings = {
                suggestion = {
                    accept = "<C-l>",
                    dismiss = "<C-o>",
                    next = "<C-j>",
                    prev = "<C-k>",
                }
            }
        },
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',

            'nvim-tree/nvim-web-devicons',
            'HakonHarnes/img-clip.nvim',
            'zbirenbaum/copilot.lua',
        }
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        branch = 'canary',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'zbirenbaum/copilot.lua',
        },
        config = true,
        cmd = 'CopilotChat',
    },
    {
        'neoclide/coc.nvim',
        branch = 'release',
        init = function()
            vim.g.coc_node_path = os.getenv('HOME') .. '/.local/share/mise/installs/node/20.8.1/bin/node'
            vim.g.coc_filetype_map = {
                htmldjango = 'html',
                json5 = 'json',
            }
        end,
        event = 'VeryLazy',
    },
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
        end,
        event = 'VeryLazy',
    },
    {
        'GR3YH4TT3R93/nvim-highlight-colors', event = "VeryLazy", config = true,
    },
    -- TODO: ctrl-y を変える
    -- {
    --     'mattn/vim-sonictemplate',
    --     cmd = 'Template',
    --     init = function()
    --         vim.g.sonictemplate_vim_template_dir = os.getenv('HOME') .. '/.templates'
    --     end,
    -- },
    -- {
    --     'mattn/emmet-vim',
    --     event = 'VeryLazy',
    -- },
    { 'IndianBoy42/tree-sitter-just', config = true,      event = 'VeryLazy', },
    { 'thinca/vim-quickrun',          cmd = 'QuickRun' },
    { 'tpope/vim-repeat',             event = 'VeryLazy', },
    { 'kylechui/nvim-surround',       event = 'VeryLazy', config = true },
    {
        'easymotion/vim-easymotion',
        init = function()
            vim.g.EasyMotion_do_mapping = 0
            vim.g.EasyMotion_smartcase = 1
            vim.g.EasyMotion_startofline = 0
            vim.g.EasyMotion_keys = ';hklyuiopnm,qwertasdgzxcvbjf'
            vim.g.EasyMotion_enter_jump_first = 1
            vim.g.EasyMotion_space_jump_first = 1
            vim.g.EasyMotion_use_migemo = 0
        end,
        event = 'VeryLazy',
    },

}
