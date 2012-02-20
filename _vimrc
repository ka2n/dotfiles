filetype plugin on

" ESC禁止

" CUIでも256で使う
set t_Co=256

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

" カーソルが行末行端で止まらないように
set whichwrap=b,s,h,l,<,>,[,]

" バックアップ
"
set backup
set backupdir=$HOME/.tmp/vim_backup
set swapfile
set directory=$HOME/.tmp/vim_swap
set autoread

" edit vimrc
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

noremap <Up> :<C-u>echohl WarningMsg \| echo "Don't use Up key!!! Press [k]" \| echohl None<CR>
noremap! <Up> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use Up key!!! Press [ESC][k]" \| echohl None<CR>
noremap <Down> :<C-u>echohl WarningMsg \| echo "Don't use Down key!!! Press [j]" \| echohl None<CR>
noremap! <Down> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use Down key!!! Press [ESC][j]" \| echohl None<CR>
noremap <Left> :<C-u>echohl WarningMsg \| echo "Don't use Left key!!! Press [l]" \| echohl None<CR>
noremap! <Left> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use Left key!!! Press [ESC][l]" \| echohl None<CR>
noremap <Right> :<C-u>echohl WarningMsg \| echo "Don't use Right key!!! Press [h]" \| echohl None<CR>
noremap! <Right> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use Right key!!! Press [ESC][h]" \| echohl None<CR>
noremap <BS> :<C-u>echohl WarningMsg \| echo "Don't use BackSpace key!!! Press [ctrl-h]" \| echohl None<CR>
noremap! <BS> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use BackSpace key!!! Press [ctrl-h]" \| echohl None<CR>

" コピー
vnoremap <silent> <C-p> "0p<CR>

" タブ移動
nnoremap <space>t :<C-u>Texplore<CR>
nnoremap >> :tabnext<CR>
nnoremap << :tabprevious<CR>

" 裏バッファーへ
nnoremap <silent><C-j> :b#<CR>


" 括弧の対応を表示
set showmatch

" タブの表示
set list
set listchars=tab:>-

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ポップアップの色
hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PmenuSbar ctermbg=0

" encoding
set encoding=utf-8

"" filetype
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

"" new file template

autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt

syntax enable

""" Neobundle "
    set nocompatible
    filetype off
    if has('vim_starting')
        set runtimepath+=~/.vim/neobundle.vim.git/
    endif
    call neobundle#rc(expand('~/.vim_bundle/'))

    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/vimproc'

    NeoBundle 'sudo.vim'
    "NeoBundle 'mattn/benchvimrc-vim'

    " Unite
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'pekepeke/unite-fileline'
    NeoBundle 'h1mesuke/unite-outline.git'
    NeoBundle 'kannokanno/unite-todo.git'

    NeoBundle 'bling/vim-airline'

    " [Edit]
    " コメント 
    NeoBundle 'scrooloose/nerdcommenter.git'

    " ZenCoding
    NeoBundle 'ZenCoding.vim'

    " YankRing.vim : ヤンクの履歴を管理し、順々に参照、出力できるようにする
    NeoBundle 'YankRing.vim'

    " ソースコード上のメソッド宣言、変数宣言の一覧を表示
    ""Bundle 'taglist.vim'

    " インデントを可視化
    "NeoBundle 'nathanaelkane/vim-indent-guides'

    " 入力補完
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neosnippet'

    " \rで即実行
    NeoBundle 'thinca/vim-quickrun'

    " ag連携
    NeoBundle 'rking/ag.vim'

    " Multiple Cursor
    NeoBundle 'terryma/vim-multiple-cursors'

    " [dict]

    " Pydiction : Python用の入力補完
    NeoBundle 'vim-flake8'
    NeoBundle 'davidhalter/jedi-vim'
    NeoBundle 'vim-scripts/virtualenv.vim' " Work with python virtualenvs within vim
    NeoBundle 'tell-k/vim-autopep8'

    " [Syntax]

    " Scala
    NeoBundle "derekwyatt/vim-scala.git"

    " Markdown
    NeoBundle 'Markdown'

    " JavaScript
    ""Bundle 'JavaScript-syntax'
    NeoBundle 'basyura/jslint.vim'
    NeoBundle 'digitaltoad/vim-jade'

    " CofeeScript
    NeoBundle 'vim-coffee-script'

    " html
    NeoBundle 'html5.vim'

    " php
    NeoBundle 'PDV--phpDocumentor-for-Vim'
    "NeoBundle 'phpfolding.vim'
    "    NeoBundle 'joonty/vdebug'

    " syntax for haml
    NeoBundle 'tpope/vim-haml'

    " syntax checking plugins for eruby, haml, html, javascript, php, python, ruby and sass.
    NeoBundle 'scrooloose/syntastic'

    " [Utility]
    " Encording
    NeoBundle 'banyan/recognize_charcode.vim'

    " [Extra]
    " Git連携
    NeoBundle 'tpope/vim-fugitive'

    " [ColorSchema]
    "NeoBundle 'desert256.vim'
    "NeoBundle 'tomasr/molokai'
    NeoBundle 'jellybeans.vim'
    " ///

"====== PLUGINS ======="
filetype plugin indent on
filetype plugin on

if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
endif

""" YankRing "
    let g:yankring_history_file = '.yankring_history'

""" neocomplcache "
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Neosnippets
let g:neosnippet#snippets_directory=$HOME.'/.vim/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><C-j> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType python setlocal omnifunc=jedi#completions

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" For jedi-vim.
"let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
let g:neocomplcache_omni_functions.python = 'jedi#completions'

""""" jedi-vim

let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#rename_command = '<leader>R'

"""""" jslint.vim
    function! s:javascript_filetype_settings()
      autocmd BufLeave     <buffer> call jslint#clear()
      autocmd BufWritePost <buffer> call jslint#check()
      autocmd CursorMoved  <buffer> call jslint#message()
    endfunction
    autocmd FileType javascript call s:javascript_filetype_settings()
  

"""" unite.vim "
    " 入力モードで開始する
    let g:unite_enable_start_insert=1
    " アウトライン
    noremap <silent> ,uo :<C-u>Unite outline<CR>
    "noremap <silent> ,ut :<C-u>Unite todo<CR>
    " バッファ一覧
    nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
    nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
    " レジスタ一覧
    nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
    " 最近使用したファイル一覧
    nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
    " プロジェクト以下を検索
    nnoremap <silent> ,ug :<C-u>Unite file_rec/async:!<CR>
    " 常用セット
    nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
    nnoremap <silent> ;; :<C-u>Unite buffer file_mru<CR>
    " 全部乗せ
    nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
    " ウィンドウを分割して開く
    au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    " ウィンドウを縦に分割して開く
    "au FileType unite nnoremap <silent> <buffer> <expr> v unite#do_action('vsplit')
    "au FileType unite inoremap <silent> <buffer> <expr> v unite#do_action('vsplit')
    " ESCキーを2回押すと終了する
    au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
    au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
    let g:unite_split_rule = "botright"

""" zen-coding
    let g:user_zen_settings = {'indentation': '    '}

""" flake8
    let g:flake8_max_line_length=99

""" autopep8
    let g:autopep8_max_line_length=99

""" Syntastic
    "let g:syntastic_enable_signs=1
    "let g:syntastic_auto_loc_list=2

"" vim-indent-guides
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_guide_size=4
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235
    let g:indent_guides_enable_on_vim_startup = 1

""" themes
    colorscheme desert

"" PHP-Doc
inoremap <C-C> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-C> :call PhpDocSingle()<CR>
vnoremap <C-C> :call PhpDocRange()<CR>

""" quickrun
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
