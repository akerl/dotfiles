""""
" Terminal settings {{{
""""
" Set keyboard for xterm support of number keys
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

" Adjust vim timeouts so that commands aren't delayed as long
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
" }}}
""""
" Core Keys {{{
""""
" Leader as space
let mapleader = "\<Space>"
" Shortcuts for write/quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :x<CR>
" }}}
""""
" Display {{{
""""
" Show syntax highlighting
syntax on
" Show column at 80 character mark if vim is new enough
if exists('+colorcolumn')
    set colorcolumn=81
endif
" Show line number and relative numbers
set number
set relativenumber
" Use F1 to toggle line numbers
nmap <F1> :set number! relativenumber! relativenumber?<cr>
imap <F1> <C-O>:set number! relativenumber! relativenumber?<cr>
" Use F3 to toggle relative line numbers
nnoremap <F3> :set relativenumber! relativenumber?<cr>
inoremap <F3> <C-O>:set relativenumber! relativenumber?<cr>
" show tab/eol with special chars when :list! used
set listchars=tab:▸\ ,eol:¬
" }}}
""""
" Input {{{
""""
" Toggle paste with leader+x or F2 (for insert mode)
nnoremap <leader>x :set invpaste paste?<cr>
nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
" Backspace should delete indents and linewrap
set backspace=indent,eol,start
" }}}
""""
" Searching {{{
""""
" Searches are case-insensitive
set ignorecase
" Searches start immediately as you type
set incsearch
" Highlight results
set hlsearch
" Hotkey to turn off persistent highlighting
nnoremap <leader>h :nohlsearch<CR>
" }}}
""""
" Indentation {{{
""""
" tabstop is the number of spaces a tab counts for
set tabstop=4
" softabstop is the number of spaces a tab counts for when editing
set softtabstop=4
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4
" expandtab turns <TAB>s into spaces
set expandtab
" enables use of shiftwidth when inserting tabs
set smarttab
" Copy indent from current line when starting a new line
set autoindent
" Do smart autoindenting when starting a new line
set smartindent
" }}}














set backupdir=~/.vim/swap
set directory=~/.vim/swap

set ttyfast
set lazyredraw

set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
nnoremap <leader>z za

set hidden

set modelines=1

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
" vim:foldmethod=marker:foldlevel=0
