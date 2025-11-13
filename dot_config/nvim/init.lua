vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.number = true
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.tmp/nvim_backup"
vim.opt.belloff = all
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.modeline = true
vim.opt.modelines = 5
vim.opt.completeopt = 'menuone', 'preview', 'noinsert', 'noselect'
vim.opt.splitright = true
vim.opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.secure = true
vim.opt.list = true
vim.opt.listchars = { tab = ':>-' }
vim.opt.helplang = 'ja', 'en'
vim.opt.showtabline = 1
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*.jpg', '*.jpeg', '*.bmp', '*.gif', '*.png' }
vim.opt.wildignore:append { '*.swp' }
vim.opt.wildignore:append { '*.DS_Store' }
vim.opt.wildignore:append { '*/.git/*' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wildignore:append { '*/.next/*' }
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,list:full'
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.visualbell = false
vim.opt.cmdheight = 2
vim.opt.relativenumber = true
vim.opt.updatetime = 100
vim.opt.clipboard = 'unnamedplus'
vim.opt.conceallevel = 1
vim.opt.formatoptions:remove('t')


vim.opt.termguicolors = true
vim.cmd([[ set t_8f=^[[38;2;%lu;%lu;%lum ]])
vim.cmd([[ set t_8b=^[[48;2;%lu;%lu;%lum ]])

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.filetype.add({
    extension = {
        mdx = 'mdx'
    }
})

require('config.lazy')
require('keymaps')
require('commands')
