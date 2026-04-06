let mapleader = " "

colorscheme habamax

set number
set relativenumber

set mouse=a

hi Normal ctermbg=NONE

set clipboard=unnamedplus

set noshowmode
set hlsearch
set incsearch

set ignorecase
set smartcase

set wildmenu
set noruler

set tabstop=2
set expandtab

set ttimeoutlen=100
nnoremap ; :
nnoremap : ;

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap ]q :cnext<cr>
nnoremap q] :cprevious<cr>
nnoremap [t gT
nnoremap ]t gt

set confirm
