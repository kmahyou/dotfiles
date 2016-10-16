""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" A vimrc configuration file
" Author: kmahyou
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Use Vim settings, rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load pathogen to manage plugins
execute pathogen#infect()

" With a map leader it's possible to do extra key combinations
" Set the leader key
let mapleader=" "

" Auto read when a file is changed outside
set autoread

" Set how many lines of history to remember
set history=300

" Allow hidden buffers
set hidden

" Enable file type detection
filetype plugin on

" Enable language-dependent indent
filetype indent on

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Set how many lines to the cursor when moving
set so=2

" Use command-line completion enhanced option
set wildmenu

" Ignore compiled files in the wild menu
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\*

" Show line numbers
set number

" Show current position
set ruler

" Height of the command bar
set cmdheight=1

" Show first match when typing a search
set incsearch

" Highlight found words in a search
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smar about cases
set smartcase

" Don't redraw while executing macros
set lazyredraw

" For regular expressions
set magic

" Show matching parenthesis, brackets, etc.
set showmatch

" Add extra margin to the left
set foldcolumn=3

"Add a coloured column to avoid going to far to the right
set colorcolumn=79

" Show at least one line above/bellow the cursor
set scrolloff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Fonts, Colors and Themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Enable syntax highlighting on
syntax on

" Set a theme
try
    colorscheme subzero
catch
endtry

" For use in a dark terminal
set background=dark
set t_Co=256

" Set a font
set guifont=Menlo\ Regular:h10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Use unix as the standard file type
set ffs=unix,dos,mac

" Encoding
set encoding=utf-8
set fileencoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Text, tab and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Expand tabs to be spaces
set expandtab

" Be smart when using tabs
set smarttab

" Set a tab as 4 spaces
set tabstop=4
set shiftwidth=4

" Be smart when indenting
set smartindent

" Auto indent
set autoindent

" Line break
set linebreak
set textwidth=79

" Wrap lines
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Moving around and tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" A way to move between windows
map <C-J> :tabnext<cr>
map <C-K> :tabprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tm :tabmove<cr>
map <leader><leader> :tabnext<cr>

" let 'tl' toggle between this and the las accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") >= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Always show the status line
set laststatus=2

" Format the status line
set statusline=FILE:\ %f%m%r%h%w\ \ \ \ TYPE:\ %y\ %=%-20.(%l,%c%V%)\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Use ^L to clear the highlighting of :set hlsearch
map <C-L> :nohlsearch<CR>

" s to reload vim config without having to restart editor
nmap <leader>s :source ~/.vimrc<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Various
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Toggle spell checking using leader+ss
map <leader>ss :setlocal spell!<cr>
