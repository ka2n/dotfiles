if !exists('g:vscode')
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
nnoremap <Space>... :<C-u>tabedit $MYVIMRC<CR>

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
nnoremap <silent><C-i> :b#<CR>

runtime! userautoload/init/*.vim
runtime! userautoload/plugins/*.vim
end
