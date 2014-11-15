filetype plugin on

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

" encoding
set encoding=utf-8

autocmd BufNewFile,BufRead Gemfile,Podfile set filetype=ruby

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

    NeoBundle 'thinca/vim-splash'

    NeoBundle 'sudo.vim'
    "NeoBundle 'mattn/benchvimrc-vim'

    " Unite
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'pekepeke/unite-fileline'
    NeoBundle 'h1mesuke/unite-outline.git'
    NeoBundle 'kannokanno/unite-todo.git'
    NeoBundle 'koron/codic-vim'
    NeoBundle 'rhysd/unite-codic.vim'
    NeoBundle 'sorah/unite-ghq'
    NeoBundle 'Shougo/neomru.vim'
    NeoBundle 'Shougo/vimfiler.vim'

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
    NeoBundle 'nathanaelkane/vim-indent-guides'

    " 入力補完
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'mattn/sonictemplate-vim'

    " gist
    NeoBundle 'mattn/gist-vim'
    NeoBundle 'mattn/webapi-vim'

    " \rで即実行
    NeoBundle 'thinca/vim-quickrun'

    " ag連携
    NeoBundle 'rking/ag.vim'

    " Multiple Cursor
    NeoBundle 'terryma/vim-multiple-cursors'

    " [dict]

    " Pydiction : Python用の入力補完
    NeoBundle 'alfredodeza/khuno.vim'
    NeoBundle 'davidhalter/jedi-vim'
    NeoBundle 'vim-scripts/virtualenv.vim' " Work with python virtualenvs within vim
    NeoBundle 'tell-k/vim-autopep8'
    NeoBundle 'hynek/vim-python-pep8-indent' " A nicer Python indentation style for vim.

    " [Syntax]

    " reStructuredText
    NeoBundle "Rykka/riv.vim"

    " Scala
    NeoBundle "derekwyatt/vim-scala.git"

    " golang
    NeoBundle 'dgryski/vim-godef' " vim plugin providing godef support

    " Markdown
    NeoBundle 'Markdown'

    " JavaScript
    ""Bundle 'JavaScript-syntax'
    NeoBundle 'basyura/jslint.vim'
    NeoBundle 'digitaltoad/vim-jade'
    NeoBundle 'jelera/vim-javascript-syntax' " Enhanced javascript syntax file for Vim
    "NeoBundle 'moll/vim-node'
    NeoBundle 'myhere/vim-nodejs-complete'

    " CofeeScript
    NeoBundle 'vim-coffee-script'

    " html
    "NeoBundle 'html5.vim'

    " php
    NeoBundle 'PDV--phpDocumentor-for-Vim'
    "NeoBundle 'phpfolding.vim'
    "    NeoBundle 'joonty/vdebug'

    " syntax for haml
    NeoBundle 'tpope/vim-haml'
    " syntax for slim
    NeoBundle 'slim-template/vim-slim'


    " syntax checking plugins for eruby, haml, html, javascript, php, python, ruby and sass.
    NeoBundle 'scrooloose/syntastic'

    " [Utility]
    " Encording
    NeoBundle 'banyan/recognize_charcode.vim'

    " [Extra]
    " Git連携
    NeoBundle 'tpope/vim-fugitive'

    " [ColorSchema]
    NeoBundle 'desert256.vim'
    NeoBundle 'tomasr/molokai'
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

""" Gist-vim "
    let g:gist_clip_command = 'pbcopy'
    let g:gist_open_browser_after_post = 1
    let g:gist_post_private = 1

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
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'

""""" node

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
    " バッファ一覧
    nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
    nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
    " レジスタ一覧
    nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
    " 最近使用したファイル一覧
    nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
    " プロジェクト以下を検索
    nnoremap <silent> ,uu :<C-u>Unite file_rec/async:!<CR>
    nnoremap <silent> ;; :<C-u>Unite buffer file_mru<CR>
    " 全部乗せ
    nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
    " ghq
    nnoremap <silent> ,ug :<C-u>Unite ghq<CR>
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

"""" vimfiler.vim "
    nnoremap <silent> ,ff :<C-u>VimFiler -split -simple -winwidth=35 -no-quit <CR>

""" zen-coding
    let g:user_zen_settings = {'indentation': '    '}

""" autopep8
    let g:autopep8_max_line_length=99

""" Syntastic
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
    nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
    let g:syntastic_ruby_checkers = ['rubocop']
    "let g:syntastic_enable_signs=1
    "let g:syntastic_auto_loc_list=2

"" vim-indent-guides
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_guide_size=1
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_start_level = 2
    let g:indent_guides_color_change_percent = 20
    let g:indent_guides_space_guides=1
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235

"" filetype
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby setl autoindent
autocmd FileType ruby setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType jade setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType coffee setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab foldmethod=indent nofoldenable
autocmd FileType jade setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab foldmethod=indent nofoldenable
autocmd FileType javascript call JavaScriptFold()
autocmd FileType javascript setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab nocindent

" golang
let g:gofmt_command = 'goimports'
set rtp+=/usr/local/opt/go/libexec/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
autocmd FileType go set noexpandtab
autocmd FileType go set nolist
autocmd BufWritePre *.go Fmt
autocmd BufNewFile,BufRead *.go set sw=2 noexpandtab ts=2
autocmd FileType go compiler go

""" themes
colorscheme molokai

"" PHP-Doc
inoremap <C-C> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-C> :call PhpDocSingle()<CR>
vnoremap <C-C> :call PhpDocRange()<CR>

""" quickrun
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc', "runner/vimproc/updatetime" : 16}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

