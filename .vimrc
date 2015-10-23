" vim:foldmethod=marker:foldlevel=0
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

let mapleader = "\<Space>"

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

nmap <silent> <leader><Up> :wincmd k<CR>
nmap <silent> <leader><Down> :wincmd j<CR>
nmap <silent> <leader><Left> :wincmd h<CR>
nmap <silent> <leader><Right> :wincmd l<CR>

nnoremap <silent> <F8> :TlistToggle<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :x<CR>
nmap <Leader><Leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <leader>e :set list!<CR>
set listchars=tab:▸\ ,eol:¬

nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
set showmode

if exists('+colorcolumn')
    set colorcolumn=81
endif

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
nnoremap <F1> :set number! number?<cr>
inoremap <F1> <C-O>:set number! number?<cr>
nnoremap <F3> :set relativenumber! relativenumber?<cr>
inoremap <F3> <C-O>:set relativenumber! relativenumber?<cr>

set ignorecase
set incsearch
set hlsearch
" turn off search highlight
nnoremap <leader>h :nohlsearch<CR>

set autoread

set backspace=indent,eol,start

set modelines=0

syntax on

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
set lazyredraw

set hidden

set nocompatible               " be iMproved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'honza/dockerfile.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/DetectIndent'
Plugin 'thoughtbot/pick.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'godlygeek/tabular'
Plugin 'rodjek/vim-puppet'
Plugin 'fatih/vim-go'
call vundle#end()

filetype plugin indent on

autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

map <C-n> :NERDTreeToggle<CR>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

let g:airline_powerline_fonts = 1
set laststatus=2

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
highlight Visual ctermbg=Black ctermfg=Cyan

syntax match Tab /\t/
highlight Tab gui=underline guifg=blue ctermbg=blue

au BufRead,BufNewFile *.md set filetype=markdown

autocmd FileType markdown :match none

autocmd BufReadPost * :DetectIndent

nnoremap <leader>b :call PickBuffer()<cr>
nnoremap <leader>p :call PickFile()<cr>
