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

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

let mapleader = "'"

nnoremap <leader>[ gT
nnoremap <leader>] gt
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>
cnoreabbrev t tabedit
nnoremap <leader>t :tabedit 

nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>
nnoremap <leader>/ <C-^>

nnoremap <silent> <leader>w :call Preserve("%s/\\s\\+$//e")<CR>

nnoremap <leader>e :set list!<CR>
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

set backupdir=~/.vim/swap
set directory=~/.vim/swap

set ttyfast

set hidden

set nocompatible               " be iMproved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/taglist.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'honza/dockerfile.vim'
call vundle#end()

filetype plugin indent on

autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

map <C-n> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
set laststatus=2

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
highlight Visual ctermbg=Black ctermfg=Cyan

au BufRead,BufNewFile *.md set filetype=markdown

match ErrorMsg '\%>80v.\+'

