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
let mapleader=","

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
" Use command-line completion enhanced option
set wildmenu

" Ignore compiled files in the wild menu
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\*,*.log,*.cache

" Show line numbers
set number

" Show current position
set ruler

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
"set foldcolumn=3

"Add a coloured column to avoid going to far to the right
set colorcolumn=79

" Set how many lines to the cursor when moving
set so=2

" Show at least one line above/bellow the cursor
set scrolloff=2

" Highlight current line
"set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Fonts, Colors and Themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Enable syntax highlighting on
syntax on

" Set a theme
try
    "colorscheme landscape
    colorscheme github 
catch
endtry

" For use in a dark terminal
set background=light
set t_Co=256

" Set a font
set guifont=Hack\ Regular:h10

" Make the self work in python to be a special word
augroup python
    autocmd!
    autocmd FileType python
            \   syn keyword pythonSelf self
            \ | highlight def link pythonSelf Special
augroup end

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

" Enable folding
"set foldmethod=indent
"set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" save and load fold/unfold view automatically
"augroup remember_folds
"    autocmd!
"    autocmd BufWinLeave *.* mkview
"    autocmd BufWinEnter *.* loadview
"augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Moving around, buffers and tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Moving between buffers
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tm :tabmove<cr>
map <leader>tt :tabnext<cr>
map <leader>tp :tabprevious<cr>

" let 'tl' toggle between this and the las accessed tab
let g:lasttab = 1
map <leader><leader> :exe "tabn ".g:lasttab<cr>
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

" Height of the command bar
set cmdheight=2

" Format the status line
"set statusline=FILE:\ %f%m%r%h%w\ \ \ \ TYPE:\ %y\ %=%-20.(%l,%c%V%)\ %P
" Changed by plugin --> lightline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Clear the highlighting of search
map <leader>ns :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Misc commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Toggle spell checking using leader+ss
map <leader>ss :setlocal spell!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Plugins configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:lightline = {
        \'component' : {
        \   'readonly': '%{&readonly?"[RO]":""}',
        \ },
        \ 'separator': { 'left': '->', 'right': '->' },
        \ 'subseparator': { 'left': '|', 'right': '|' }
    \}

" Do not show vim info, because it is provided by the status line
set noshowmode

