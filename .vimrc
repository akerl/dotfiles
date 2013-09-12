if &term=="xterm" || &term=="xterm-color"
     set t_Co=8
     set t_Sb=^[4%dm
     set t_Sf=^[3%dm
     :imap <Esc>Oq 1
     :imap <Esc>Or 2
     :imap <Esc>Os 3
     :imap <Esc>Ot 4
     :imap <Esc>Ou 5
     :imap <Esc>Ov 6
     :imap <Esc>Ow 7
     :imap <Esc>Ox 8
     :imap <Esc>Oy 9
     :imap <Esc>Op 0
     :imap <Esc>On .
     :imap <Esc>OQ /
     :imap <Esc>OR *
     :imap <Esc>Ol +
     :imap <Esc>OS -
endif

nnoremap <F3> :set list!<CR>
inoremap <F1> <C-O>:set number! number?<cr>
set listchars=tab:▸\ ,eol:¬

nnoremap <F1> :set number! number?<cr>
inoremap <F1> <C-O>:set number! number?<cr>

nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
set showmode

nnoremap ; :

set backspace=indent,eol,start

set modelines=0

syntax on
set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

set ttyfast

set nocompatible               " be iMproved

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/taglist'
Bundle 'scrooloose/nerdtree'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

filetype plugin indent on

let g:airline_powerline_fonts = 1
set laststatus=2

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
highlight Visual ctermbg=Black ctermfg=Cyan

