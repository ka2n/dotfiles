syntax enable

""" プラグイン
source $HOME/.nvimrc.bundles

""" vimrcからコピーしたいろいろ

" IM無効
set imdisable

" ビープを消す
set visualbell

" ステータス行を表示
set laststatus=2

" タブをスペースに
set expandtab
set tabstop=4
set softtabstop=4

" インデントのスペース数
set shiftwidth=4

" インデント
set autoindent
set smartindent

" インクリメンタルサーチ
set incsearch

" 行数
set number

set modeline
set modelines=5

set foldlevelstart=30

" 補完でウィンドウを開かない
set completeopt=menuone

" 新しいウィンドウを下部で開く
set splitbelow

" カーソルが行末行端で止まらないように
set whichwrap=b,s,h,l,<,>,[,]

" 括弧の対応を表示
set showmatch

" タブの表示
set list
set listchars=tab:>-

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

""" 操作系

" .nvimrcを開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

" タブ移動
nnoremap <space>t :<C-u>Texplore<CR>
nnoremap >> :tabnext<CR>
nnoremap << :tabprevious<CR>

" 裏バッファーへ
nnoremap <silent><C-j> :b#<CR>

""" 色
"colorscheme railscasts
colorscheme molokai

""" GO plugin
set rtp^=${GOROOT}/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

filetype plugin on

""" ファイルごとの設定
source $HOME/.nvimrc.ft

""" プラグイン設定
source $HOME/.nvimrc.bundle_settings
