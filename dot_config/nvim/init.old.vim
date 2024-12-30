set number
set backup
set backupdir=$HOME/.tmp/nvim_backup
set imdisable
set belloff=all
set laststatus=2
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set incsearch
set modeline
set modelines=5
set completeopt=menuone,preview,noinsert,noselect
set splitright
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set smartcase
set hidden
set secure
set list
set listchars=tab:>-
set helplang=ja,en
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.swp
set wildignore+=*/.git
set wildignore+=*.DS_Store
set wildmode=longest,list:full
set wrap
set noswapfile
set novisualbell
set cmdheight=2
set relativenumber
set updatetime=100
set termguicolors
:set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

let mapleader = "\<Space>"

set guifont=Fira\ Code:h16

" neovide appearance
if exists('g:neovide')
  set guifont=Fira\ Code:h10
en

" .vimrcを開く
nnoremap <Space>... :<C-u>tabedit $MYVIMRC<CR>

" タブ移動
nnoremap <space>t :<C-u>Texplore<CR>
nnoremap >> :tabnext<CR>
nnoremap << :tabprevious<CR>

" Window
nnoremap <Return><Return> <C-w><C-w>

" 表示行単位で行移動する
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" neovide keymappings
if exists('g:neovide')
  nnoremap <silent><C-6> <C-^>
en

runtime! userautoload/init/*.vim
runtime! userautoload/plugins/*.vim

let g:nord_italic = v:false
colorscheme nord
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " 文字色
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " 背景色
