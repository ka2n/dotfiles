-- packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Color Scheme
    use {
        'shaunsingh/nord.nvim', config = function()
            vim.g.nord_italic = false
            require('nord').set()
            vim.cmd [[colorscheme nord]]
    end,}

    use 'folke/lsp-colors.nvim'

    use {
        'nvim-neo-tree/neo-tree.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        }
    }

    -- Help
    use 'vim-jp/vimdoc-ja'

    -- Template, Snippet
    use { 
        'mattn/sonictemplate-vim', setup = function()
            vim.g.sonictemplate_vim_template_dir = { '~/.templates' }
            vim.g.sonictemplate_key = 0
            vim.g.sonictemplate_intelligent_key = 0
            vim.g.sonictemplate_postfix_key = 0
        end,
    }

    use { 
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup()
        end,
    }

    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require"telescope".load_extension("frecency")
        end,
        requires = {"kkharji/sqlite.lua"}
    }

    -- Completion
    use { 'github/copilot.vim', setup = function()
        vim.g.copilot_node_command = os.getenv('HOME') .. '/.asdf/installs/nodejs/16.17.0/bin/node'
    end, }

    -- LSP support
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        setup = function()
            vim.g.coc_node_path = os.getenv('HOME') .. '/.asdf/installs/nodejs/18.9.0/bin/node'
        end,
    }
    use {
        'fannheyward/telescope-coc.nvim',
        config = function()
            require"telescope".load_extension("coc")
        end,
    }

    -- Language
    use {
        'mattn/emmet-vim', setup = function() 
            vim.g.user_emmet_leader_key = '<C-x>'
        end,
    }

    use {
        'nathom/filetype.nvim',
        config = function()
            require('filetype').setup {
                overrides = {
                    extensions = {
                        tf = "terraform",
                        tfvars = "terraform",
                        tfstate = "json",
			hbs = "html",
                    },
                }
            }
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true,
                },
            }
        end,
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use 'jparise/vim-graphql'
    use {
        "IndianBoy42/tree-sitter-just",
        config = function()
            require('tree-sitter-just').setup {}
        end,
    }

    -- Apps
    -- use 'glidenote/memolist.vim', { 'on': ['MemoNew', 'MemoGrep', 'MemoList'] }

    -- Other tools
    use "tpope/vim-repeat"

    use { 
        'easymotion/vim-easymotion',
        setup = function()
            vim.g.EasyMotion_do_mapping = 0
            vim.g.EasyMotion_smartcase = 1
            vim.g.EasyMotion_startofline = 0
            vim.g.EasyMotion_keys = ';hklyuiopnm,qwertasdgzxcvbjf'
            vim.g.EasyMotion_enter_jump_first = 1
            vim.g.EasyMotion_space_jump_first = 1
            vim.g.EasyMotion_use_migemo = 1
        end,
    }
    

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = { '$MYVIMRC', '*.lua' },
})
