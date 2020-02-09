
call plug#begin('~/.cache/vim-plug')

" Help
Plug 'vim-jp/vimdoc-ja'

" LSP support
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'glidenote/memolist.vim', { 'on': ['MemoNew', 'MemoGrep', 'MemoList'] }

" Other ondemand tools
Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }

call plug#end()


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
