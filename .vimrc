" ~/.vimrc — tracked in En-PingSu/dotfiles
" Curated from kunchenguid's Neovim config, ported to plain Vim, plus Go setup.

" ---- enable syntax + filetype plugins (REQUIRED for vim-go to load) ----
" A user vimrc disables Vim's auto-enable of these, so turn them on explicitly.
syntax on
filetype plugin indent on

" ---- general ----
let mapleader = " "                 " space as leader
set number relativenumber           " hybrid line numbers
set ignorecase smartcase            " smart-case search
set incsearch hlsearch              " incremental + highlighted search
set scrolloff=8                     " keep cursor off the screen edge
set clipboard=unnamed               " share the macOS system clipboard
set autowrite                       " save before :GoBuild / :make etc.

" ---- indentation: spaces by default ----
set expandtab shiftwidth=2 softtabstop=2
" Go uses tabs (gofmt) — don't expand them in .go files
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4

" ---- persistent undo ----
set undofile
set undodir=$HOME/.vim/undo

" ---- paste over a selection without losing your yank (kun's trick) ----
xnoremap <expr> p 'pgv"'.v:register.'y'

" ---- vim-go (installed as a native package under ~/.vim/pack) ----
let g:go_bin_path = expand('$HOME/go/bin')   " where gopls/goimports live
let g:go_fmt_command = "goimports"           " format + auto-manage imports on save
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_doc_keywordprg_enabled = 0          " don't hijack K
" gd = go to definition (vim-go default); also :GoRename, :GoTest, :GoDoc
