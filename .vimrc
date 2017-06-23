""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mantainer: R3bs
"
" Version: 1.0
"
" Sections:
"
"   -> Vim-Plug Installation
"   -> Folding Info
"   -> Folding Created Subsections:
"
"       * Colors
"       * Misc
"       * Spaces and Tabs
"       * UI Layout
"       * Searching
"       * Autogroups
"       * Backup
"       * Custom Functions
"       * Vim Plug Input:
"
"           - Plugin: Lightline
"           - Plugin: Solarized Colors
"           - Plugin: NERDTree
"           - Plugin: Commentary
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug Installation:
"
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" ~on vim~ this command will download and install all plugins:
" $ :PlugInstall
"
" ref: https://github.com/junegunn/vim-plug
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding Info:
"
" 	-> foldmethod=marker - fold sections by markers, rather than indentation
"	-> foldlevel=0		 - close every fold by default
" 	-> set modelines=1   -  make Vim only use these settings for this fil
"
"   ---------------------------------------
"   To use folding:
"
"   zi   :   toogle all folding open/close
"   za   :   toogle current fold open/close
"   zc   :   close current fold
"   zR   :   open all folds
"   zM   :   close all folds
"   zv   :   expand folds to reveal cursor
"   ---------------------------------------
"
" ref: https://dougblack.io/words/a-good-vimrc.html                   
"

" Colors {{{

syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized color theme
"
" ref: http://ethanschoonover.com/solarized/vim-colors-solarized
set background=dark
let g:solarized_termcolors=256

" }}}

" Misc {{{

set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse support
set ttyfast
set mouse=a

" }}}

" Spaces and Tabs {{{

set tabstop=2		" 2 space tab
set expandtab		" changes tabs for spaces
set softtabstop=2	" 2 space tab
set shiftwidth=2
set autoindent

" }}}

" UI Layout {{{

set number		" line number
set showcmd		" show command on bottom bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split config
set splitbelow
set splitright

" }}}

" Searching {{{

set ignorecase		" ignore case when searching
set incsearch		" search as characters are entered
set showmatch       " show mathcing in text

" }}}

" Autogroups {{{

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear trailing white spaces when saving
"
" ref: http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
"
autocmd BufWritePre *.py :%s/\s\+$//e

" }}}

" Backup {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" }}}

" Custom Functions {{{

" toggle between number and relativenumber
" use: :call ToggleNumber()
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" }}}

" Vim Plug {{{

call plug#begin('~/.vim/plugged')

    " Lightline plugin
    Plug 'itchyny/lightline.vim'

    " SOlarized color theme
    Plug 'altercation/vim-colors-solarized'

    " NERDTree file tree
    Plug 'scrooloose/nerdtree'

    " Commentary plugin
    Plug 'tpope/vim-commentary'

    " ALE - Asynchronous Lint Engine
    Plug 'w0rp/ale'

call plug#end()

" }}}

" Plugin: Lightline {{{

" to show airline colors
set laststatus=2

" }}}

" Plugin: Solarized Colors {{{

" It must be after the vim plug call and be separated of the background
" color and syntax on
"
" ref: https://github.com/altercation/vim-colors-solarized/issues/104
colorscheme solarized

" }}}

" Plugin: NERDTree {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Tree
"

autocmd StdinReadPre * let s:std_in=1

" How can I open a NERDTree automatically when vim starts up if no files were
" specified?
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" How can I open NERDTree automatically when vim starts up on opening a
" directory?
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" }}}

" Plugin: Commentary {{{

" Use the command below to insert not known commentary for file type
"autocmd FileType apache setlocal commentstring=#\ %s

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" need to be here for folding to work
" vim:foldmethod=marker:foldlevel=0
