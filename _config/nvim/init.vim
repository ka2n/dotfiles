
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
"set termguicolors


" .vimrcを開く
nnoremap <Space>.. :<C-u>tabedit $MYVIMRC<CR>

" タブ移動
nnoremap <space>t :<C-u>Texplore<CR>
nnoremap >> :tabnext<CR>
nnoremap << :tabprevious<CR>

" 表示行単位で行移動する
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" 裏バッファーへ
nnoremap <silent><C-j> :b#<CR>


"dein Scripts-----------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/k2/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/k2/.cache/dein')
  call dein#begin('/home/k2/.cache/dein')

  " Add or remove your plugins here like this:
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

nnoremap <Space>.dd :<C-u>tabedit ~/.config/nvim/dein.toml<CR>
nnoremap <Space>.dl :<C-u>tabedit ~/.config/nvim/dein_lazy.toml<CR>

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
