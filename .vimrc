set number
set showmatch
set ruler

colorscheme desert
syntax enable
syntax on
set background=dark
set t_Co=256

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set nocompatible
set autoread

set nobackup
set noswapfile

set cursorcolumn
set cursorline

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab

set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase

set foldenable
set foldmethod=indent
set foldlevel=99

set title
set novisualbell
set noerrorbells
set t_vb=
set tm=500

set smartindent
set autoindent

set hidden
set showcmd
set showmode

set scrolloff=7

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set ffs=unix,dos,mac

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

"set guifont=Microsoft_YaHei_Mono:h11

"Set Map Leader
let mapleader="\<Space>"

map <silent> <leader>ss :source ~/_vimrc<cr>
map <silent> <leader>ee :e ~/_vimrc<cr>
map <silent> <leader>w :w!<cr>
map <silent> <leader><cr> :noh<cr>

autocmd! bufwritepost _vimrc source ~/_vimrc

set history=700

set cmdheight=2

set lbr
set tw=500

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

au GUIEnter * simalt ~x

set autochdir

let g:miniBufExplMapWindowNavArrows = 1 
inoremap jk <ESC>
