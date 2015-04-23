syntax enable

""" プラグイン
source $HOME/.vimrc.bundles

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

" バックアップ
set backup
set backupdir=$HOME/.tmp/vim_backup
set noswapfile

" 括弧の対応を表示
set showmatch

" タブの表示
set list
set listchars=tab:>-

""" 色
colorscheme hybrid

" diffの文字色を見やすく
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

" 全角スペースの表示
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" match ZenkakuSpace /　/

""" 操作系

" .vimrcを開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

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

""" GO plugin
set rtp^=${GOROOT}/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

" Dash.app
function! s:dash(...)
    let word = len(a:000) == 0 ? input('Dash search: ') : a:1
    call system(printf("open dash://'%s'", word))
endfunction
command! -nargs=? Dash call <SID>dash(<f-args>)
nmap <silent> K :Dash <C-R><C-W><CR>

let g:netrw_browsex_viewer = 'open'

filetype plugin on

""" ファイルごとの設定
source $HOME/.vimrc.ft

""" プラグイン設定
source $HOME/.vimrc.bundle_settings
